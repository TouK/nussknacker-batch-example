# Nussknacker Batch Example

[//]: # (TODO: Update blog post link after its uploaded)
This is a demo for upcoming Batch mode in Nussknacker. It is an interactive part of [this blog post](https://nussknacker.io/blog/name-of-blog/).

## Installation 
1. Make sure you have installed required dependencies:
   - `git` - https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
   - `docker` - https://git-scm.com/downloads
2. Clone this repository using git - `git clone https://github.com/TouK/nussknacker-batch-example.git` - this will make this repository available on your machine
3. Deploy the services using docker by running the `start.sh` shell script
   - If you're not able to run the shell script, you can deploy the services manually with `docker compose -f docker-compose.yml up -d --build`
4. Visit Nussknacker Designer at `http://localhost:8080/` using you browser of choice and login using `admin/admin` credentials

## Uninstallation
1. Uninstall the services using docker by running the `stop.sh` shell script
   - If you're not able to run the shell script, you can deploy the services manually with `docker compose -f docker-compose.yml down`
2. Remove the folder with cloned repository:
   - If you encounter an error with lack of permissions for `transactions` or `transactions_summary` when trying to delete the folder, you can delete them by changing the owner to the current user or using administrator rights 
