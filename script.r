source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
####################################################

# TODO: sort by ID if not null or by X 



################### Actual code ####################

p <- plot_ly(x =X[,1], y = Y[,1], type = 'scatter', name = names(Y)[1] , mode = 'lines', fill = 'tozeroy')

for (j in seq(2,length.out = (ncol(Y)-1)))
{
  p = p  %>% add_trace(x =X[,1], y = Y[,j], name = names(Y)[j], fill = 'tozeroy')
  print(j)
}

p = p  %>%  layout(xaxis = list(title = names(X)[1]),
                   yaxis = list(title = 'Y'))



####################################################

############# Create and save widget ###############
#p = ggplotly(g);
internalSaveWidget(p, 'out.html');
####################################################
