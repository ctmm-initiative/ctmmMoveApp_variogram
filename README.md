# Variogram

MoveApps

Github repository: https://github.com/ctmm-initiative/ctmmMoveApp_variogram

## Description
Creates a variogram for visualisation of the autocorrelation structure of the movement tracks. 

## Documentation
Before fitting continuous-time movement models (ctmms) to movement tracks, it is (as of now) important to ensure that the data are of animals in range residence, which is an assumption of the models. Variograms visualize autocorrelation structure in an unbiased way when e.g. migration, range shifting, drift or other translations of the mean location are happening. See details in the [ctmm vignette for variograms](https://cran.r-project.org/web/packages/ctmm/vignettes/variogram.html).

### Input data
ctmm `telemetry.list`. 

### Output data
ctmm `telemetry.list`.

### Artefacts
none

### Settings
`Fraction`: The proportion of the variogram that will be plotted. By default, half is shown (= 0.5). The tail end is generally not very meaningful. Note, this changes the x-axis. 

`Columns`: The number of panels of the figure. 

`Same axes for all individuals`: For all individuals the same scalings of the x-axis and y-axis are used. 

`Select animal(s)`: By default `All` animals are selected. Other options are to select individual animals or select `population` for a population-level variogram. (see pooling variograms in the [vignette](https://cran.r-project.org/web/packages/ctmm/vignettes/variogram.html)).

`Store settings`: click to store the current settings of the app for future workflow runs

### Most common errors
Please file an issue if you encounter an error. 

### Null or error handling

