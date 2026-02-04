# R Shiny App Example for Renku

A short example of how to run a shiny app on Renku.

## Step 1

Build and publish the image to an image repository.

## Step 2
Then, create a project in Renku and a custom environment using 
the published docker image and the following configuration:

- Container image: use the image you built and published in Step 1
- Mount directory: `/home/renku/work`
- Work directory: `/home/renku/work` (same as above)
- UID: `1000`
- GID: `1000`
- Default URL: `/`
- Port: use the default of `8888`
- Command ENTRYPOINT: leave blank
- Command Arguments CMD: leave blank
- Strip session URL Path prefix: Yes (make sure to check the checkbox)

