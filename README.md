
# Versions

- R: 3.6.2 (2019-12-12)
- RStudio: 1.2.5019
- renv: 0.9.2-13
- rsconnect: 0.8.16-9000

# Deploy Works

Before adding the github dependency, the app deploys. Checkout commit cc35095.

# Add Github Dependency

```R
renv::install("th86/concordanceIndex”)
renv::snapshot()
```

# Deploy Failure

```
> rsconnect::deployApp()
Preparing to deploy application...
Update application currently deployed at
https://iatlas-test.shinyapps.io/084-single-file/? [Y/n] y
DONE
Uploading bundle for application: 1597446...Warning in FUN(X[[i]], ...) :
  Unable to find repository URL for package concordanceIndex
DONE
Deploying bundle: 2688358 for application: 1597446 ...
Waiting for task: 678405041
  building: Building image: 2935776
  building: Building package: concordanceIndex
################################ Begin Task Log ################################
################################# End Task Log #################################
Error: Unhandled Exception: Child Task 678405042 failed: Error building image: Error fetching concordanceIndex (0.1) source. <CRANPackageSource repo='http://cran.rstudio.org'> unable to satisfy package: concordanceIndex (0.1)
In addition: Warning message:
In FUN(X[[i]], ...) :
  Package 'concordanceIndex 0.1' was installed from sources; Packrat will assume this package is available from a CRAN-like repository during future restores
```

# Current Fix

* https://docs.rstudio.com/shinyapps.io/getting-started.html (section: "2.4.0.1 Important note on GitHub packages")

```R
devtools::install_github("th86/concordanceIndex", force=TRUE)
```
