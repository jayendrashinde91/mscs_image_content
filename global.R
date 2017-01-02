#image_content_description global::


Analyse_image = function(input_image=input_image,
                        MSCS_Key=MSCS_Key,
                        visualFeature_options = visualFeature_options,
                        detail_options=NULL)
  #### VISION
  {

      if(is.null(detail_options)) {
        MS_CS_URL <- paste("https://api.projectoxford.ai/vision/v1.0/analyze?visualFeatures=",visualFeature_options,"&details",sep="")
      }
      if(!is.null(detail_options))  {
        MS_CS_URL <-paste("https://api.projectoxford.ai/vision/v1.0/analyze?visualFeatures=",visualFeature_options,"&",detail_options,sep="")
      }
    
    
  is_url <- RCurl::url.exists(input_image)
  if(is_url==TRUE){
    AnalyzePic <-POST(url = MS_CS_URL,
                       content_type('application/json'),
                       add_headers(.headers = c('Ocp-Apim-Subscription-Key' = MSCS_Key)),
                       body=list(url = input_image),
                       encode = "json")
  }
  if(is_url==FALSE){
    body_image <- upload_file(input_image)
    AnalyzePic <- POST(MS_CS_URL,
                        body = body_image,
                        add_headers(.headers = c("Content-Type"="application/octet-stream",
                                                 "Ocp-Apim-Subscription-Key"=MSCS_Key)))
    
  }
  
  return(AnalyzePic)
}