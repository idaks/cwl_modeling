  # @BEGIN calculate_models 
  # @IN predlist
  # @IN carscores
  # @in max.preds 
  # @OUT linear.models
  allModels <- data.table::data.table(cell=numeric(),year=numeric(),model=numeric(),numPreds=numeric(),CV=numeric(),AICc=numeric(),coefs=numeric())
  complete.cell.years <- data.table::data.table(cell=numeric(),year=numeric())
  times <- vector('numeric',max(prednums))
  # @BEGIN defineLinearModels
  # @IN predlist
  # @IN carscores
  # @in max.preds
  # @OUT models
  # @OUT matches
  for(i in 1:maxPreds){
    if(verbose) cat("\nCalculating models of with",i,"input vectors.")
    t <- Sys.time()
    
    new.t <- Sys.time()
    preds <- predlist[prednums>=i,]
    
    ## MATCHES 1
    matches <- lapply(rownames(preds),function(this.year){
      # cat(this.year,'\n')
      complete.cells <- c(complete.cell.years[year==as.numeric(this.year), cell],null.cells)
      
      pred.names <- colnames(preds)[preds[this.year,]]
      if(all((rownames(carscores) %in% complete.cells))) return(NULL)
      models <- data.table::data.table(matrixStats::rowRanks(as.matrix(carscores[!(rownames(carscores) %in% complete.cells),pred.names,with = F]), ties.method = 'min')<=i)
      data.table::setnames(models,pred.names)
      # which(apply(as.matrix(models),1,function(x){!any(x)}))
      models[,cell:=as.numeric(rownames(carscores)[!(rownames(carscores) %in% complete.cells)])]
      # models <- models[cell %in% which(!completed.cells)]
      data.table::setorderv(models,pred.names,rep(-1,length(pred.names)))
      models.duplicates <- !duplicated(models,by=pred.names)
      models.matches <- cumsum(models.duplicates)
      names(models.matches) <- models$cell
      models.matches <- models.matches[order(as.numeric(names(models.matches)))]
      models <- models[models.duplicates,]
      models[,cell:=NULL]
      blank.models <- !apply(models,2,any)
      blank.models <- names(blank.models)[blank.models]
      if(length(blank.models)>0){
        models[,(blank.models):=NULL]
      }
      # if(any(apply(as.matrix(models),1,function(x){!any(x)}))) error("PROBLEM!")
      return(list(models=models,matches=models.matches))
    })
    gc();gc()
    
    match.names <- rownames(preds)[!sapply(matches,is.null)]
    matches <- matches[!sapply(matches,is.null)]
    
    models <- lapply(matches,'[[','models')
    matches <- lapply(matches,'[[','matches')
    names(matches) <- match.names
    names(models) <- match.names
    
    nummodels <- c(0,cumsum(sapply(models,nrow)))[0-(length(models)+1)]
    names(nummodels) <- names(models)
    
    models <- data.table::rbindlist(models,fill=T)
    pred.names <- sort(names(models))
    data.table::setcolorder(models,pred.names)
    models[,model:=1:nrow(models)]
    
    if(nrow(models)==0) break
    ## Replace all NAs with FALSE (we aren't going to use those predictors, right?)
    for (this.model in seq_along(models)){
      data.table::set(models, i=which(is.na(models[[this.model]])), j=this.model, value=F)
    }
    
    matches <- lapply(1:length(matches),function(count){return(list(year=rep(names(matches)[count],length(matches[[count]])),matches=matches[[count]]+nummodels[count]))})
    
    matches.years <- unlist(lapply(matches,'[[','year'))
    matches.matches <- unlist(lapply(matches,'[[','matches'))
    
    matches <- do.call(rbind,list(cell=as.integer(names(matches.matches)),year=as.integer(matches.years),model=as.integer(matches.matches)))
    colnames(matches) <- NULL
    matches <- data.table::data.table(t(matches))
    
    rm(matches.years, matches.matches)
    gc();gc()
    
    models <- data.table::setorderv(models,pred.names,rep(-1,length(pred.names)))
    models.duplicates <- !duplicated(models,by=pred.names)
    models.matches <- cumsum(models.duplicates)
    names(models.matches) <- models$model
    models.matches <- models.matches[order(as.numeric(names(models.matches)))]
    models <- models[models.duplicates,]
    models[,model:=NULL]
    models.matches <- data.table::data.table(model=as.integer(names(models.matches)),new.model=models.matches)
    
    setkey(matches,model)
    setkey(models.matches,model)
    
    matches <- matches[models.matches]
    matches[,model:=NULL]
    setnames(matches,c('cell','year','model'))
    matches <- data.table::setorderv(matches,c('cell','year','model'),c(1,1,1))
    
    rm(models.duplicates,models.matches); gc(); gc()
    
    if(nrow(complete.cell.years)>0){
      which.matches <- merge(matches,complete.cell.years,by=c("cell","year"), all.x=T)[is.na(model.y)]
      matches <- which.matches[,list(cell,year,model.x)]
      setnames(matches,c("cell",'year','model'))
    }
    
    setkey(matches,model)
    # @END defineLinearModels
    if(verbose) cat("\nDefine models:", round(difftime(Sys.time(),new.t,units='mins'),digits=2),"minutes")
    # @BEGIN calculateLinearModels
    # @IN models
    # @IN matches
    # @OUT coefficients
    # @OUT model.errors
    new.t <- Sys.time()
    all.lms <- lapply(1:nrow(models),function(this.model){
      # cat(this.model,'\n')
      if(!(this.model %in% matches[['model']])) return(NULL)
      cells <- unique(matches[list(this.model),cell])
      
      predictand.names <- names(models[this.model])[which(as.logical(models[this.model]))]
      model.mlm <- lm(predictand.matrix[,cells,drop=F]~predictor.matrix[,predictand.names,drop=F])
      
      # Get model errors
      model.errors <- data.table::data.table(CV_mlm(model.mlm))
      model.errors[,cell:=cells]
      
      data.table::setkey(model.errors,cell)
      
      # Get coefficients
      
      coefs <- data.table::data.table(t(as.matrix(model.mlm$coefficients)))
      data.table::setnames(coefs,c("Intercept",colnames(predictor.matrix[,predictand.names,drop=F])))
      coefs <- lapply(1:nrow(coefs),function(j){
        out <- as.numeric(coefs[j])
        names(out) <- colnames(coefs)
        return(out)
      })
      names(coefs) <- cells
      
      coefs <- coefs[order(as.integer(names(coefs)))]
      
      if(length(coefs)==1){
        model.errors[,coefs:=list(coefs)]
      }else{
        model.errors[,coefs:=coefs]
      }
      model.errors[,model:=this.model]
      data.table::setcolorder(model.errors,c("cell","model","CV","AICc","coefs"))
      data.table::setkey(model.errors,cell,model)
      
      return(model.errors)
    })
    all.lms <- all.lms[!sapply(all.lms,is.null)]
    if(verbose) cat("\nCalculate",length(all.lms),"linear models:", round(difftime(Sys.time(),new.t,units='mins'),digits=2),"minutes")
    rm(models); gc(); gc()
    # @END calculateLinearModels
    
    # @BEGIN simplifyLinearModels
    # @IN coefficients
    # @IN model.errors
    # @OUT final.models @as linear.models
    ## LMS SIMPLIFY PREP
    new.t <- Sys.time()
    
    all.lms <- data.table::rbindlist(all.lms,fill=T)
    setkey(all.lms,cell,model)
    all.lms[,numPreds:=i]
    
    if(nrow(allModels)==0){
      data.table::setkey(all.lms,cell,model)
      data.table::setkey(matches,cell,model)
      allModels <- matches[all.lms]
      
      setcolorder(allModels,c("cell","year","model","numPreds","CV","AICc","coefs"))
    }
    
    all.lms.stats <- all.lms[,list(cell,model,AICc)]
    setkey(all.lms.stats,cell,model)
    setkey(matches,cell,model)
    
    all.lms.stats <- matches[all.lms.stats]
    rm(matches)
    
    data.table::setkey(all.lms.stats,cell,year,model)
    
    allModels.stats <- allModels[,list(cell,year,model,AICc)]
    
    allModels.stats <- rbind(allModels.stats,all.lms.stats,fill=T)
    
    data.table::setkey(allModels.stats,cell,year)
    data.table::setorder(allModels.stats,cell,year,AICc)
    allModels.stats <- allModels.stats[allModels.stats[,!duplicated(year),by=cell]$V1,]
    
    data.table::setkey(allModels,cell,year,model)
    if(nrow(allModels.stats[model==0,list(cell,year,model)])>0){
      allModels.old <- merge(allModels.stats[model==0,list(cell,year,model)],allModels,by=c("cell","year","model"), all=T)
    }else{
      allModels.old <- data.table(cell=numeric(),year=numeric(),model=numeric(),numPreds=numeric(),CV=numeric(),AICc=numeric(),coefs=numeric())
    }
    
    if(nrow(allModels.stats[model!=0,list(cell,year,model)])>0){
      allModels.new <- merge(allModels.stats[model!=0,list(cell,year,model)],all.lms.stats,by=c("cell","year","model"), all=T)
      allModels.new <- merge(allModels.new[,list(cell,year,model)],all.lms,by=c("cell","model"),all=T)
      data.table::setcolorder(allModels.new,c("cell","year","model","numPreds","CV","AICc","coefs"))
    }else{
      allModels.new <- data.table::data.table(cell=numeric(),year=numeric(),model=numeric(),numPreds=numeric(),CV=numeric(),AICc=numeric(),coefs=numeric())
    }
    
    allModels <- rbind(allModels.old,allModels.new)
    
    data.table::setkey(allModels,cell,year)
    data.table::setorder(allModels,cell,year,AICc)
    allModels <- allModels[allModels[,!duplicated(year),by=cell]$V1,]
    
    complete.cell.years <- allModels[model==0,list(cell,year,model)]
    
    allModels[,model:=0]
    
    setkey(allModels,cell,year,numPreds)
    
    if(verbose) cat("\nClean linear models:", round(difftime(Sys.time(),new.t,units='mins'),digits=2),"minutes")
    # @END simplifyLinearModels
    
    time <- difftime(Sys.time(),t,units='mins')
    if(verbose) cat("\nTotal modeling time:",round(time,digits=2),"minutes\n")
    times[i] <- time
    if((nrow(allModels)-nrow(complete.cell.years))==0) break
    if(verbose) cat(nrow(allModels)-nrow(complete.cell.years),"cell-years remaining\n")
    ## 
    
  }
  
  if(verbose) cat("\nTotal Modeling Time:",sum(times),"minutes\n")
  # @END calculateModels
  