
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

> Only packages installed from GitHub with devtools::install_github, in version 1.4 (or later) of devtools, are supported. Packages installed with an earlier version of devtools must be reinstalled with the later version before you can deploy your application. If you get an error such as “PackageSourceError” when you attempt to deploy, check that you have installed all the packages from Github with devtools 1.4 or later.
> https://docs.rstudio.com/shinyapps.io/getting-started.html<br>(section: "2.4.0.1 Important note on GitHub packages")

```R
renv::install('devtools')
devtools::install_github("th86/concordanceIndex", force=TRUE)
```

NOTE: I had to close RStudio and re-open it before deploy actually worked:

```
> rsconnect::deployApp()
Preparing to deploy application...
Update application currently deployed at
https://iatlas-test.shinyapps.io/084-single-file/? [Y/n] y
DONE
Uploading bundle for application: 1597446...DONE
Deploying bundle: 2688378 for application: 1597446 ...
Waiting for task: 678409412
  building: Building image: 2935796
  building: Installing packages
  building: Installing files
  building: Pushing image: 2935796
  deploying: Starting instances
  terminating: Stopping old instances
Application successfully deployed to https://iatlas-test.shinyapps.io/084-single-file/
```

# GitHub Packages Tested & Not Working

In addition to the concordanceIndex package, I also tested ImmuneSubtimeClassifier, which fails in a similar way.

- https://github.com/Gibbsdavidl/ImmuneSubtypeClassifier
- https://github.com/th86/concordanceIndex
