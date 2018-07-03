

# Preparation:
    Run workspace_init.sh - this will setup a workspace and simple github repository
  
# Setup Workspace:
   Here, we have a brand new workspace that doesn't have any terraform configs, permissions, or any history. We will work through the following:

   ## delegating responsibility to our teams
      Add write permissions for operators
      Add read permissions for developers

   ## setting appropriate variables
      ### show that developers can read variables but not set
      ### show that operators are able to edit the variables

      A workspace in TFE is tied to one environment using one terraform configuration. In order to help facilitate code reuse, we are able to set variables per workspace. Here you'll see that we've already set a few variables. Some of which are Terraform variabls and some of which are Environment Variables. You will notice that some of these Environment Variables are labelled as sensitive. 

      ### Senstive Variables use an embeddded Vault server, and are write only.
          If you want to change these values, you actually have to delete the variable and re-create.

    ## create configuration using configuration designer
    
   ## running an apply
      Show that developers are not able to run an apply
      Run apply as operator
      - discuss auto apply vs manual apply

   ## running a destroy
   ## enforcing policy
   ## breaking policy through PR
   ## fixing PR, then pushing again and running apply

   
  - Show Variables
      - Sensitive Variables are stored in Vault
    
  - go through each of the tabs
    Current Run should show nothing as we haven't run anything yet
    Runs will show setting up variables. 
    Variables:
      - Terraform Variables
      - Environment Variables
      - Sensitive Variables


  - Owner creates
  - Operators have write
  - developers have read

Roles:
  Assign appropriate permissions
  - owners
  - operators (write)
  - developers (read)

Create new config using Configuration Designer
  - pull together a few very simple modules

Build Infrastructure:
  - manual ui apply

Operator makes change (through github UI) to new branch:
  - copies output of configuration designer to main.tf in new branch. Introduce Error (workspace should already be setup).
  - show webhook flow and how you're warned on the github page that the merge will break
  - delete branch
  - copy and paste the code into new branch with no errors
  - show webhook flow.

Sentinel:
  - copy output of config designer into new branch, but introduce violation
  - show how sentinel prevents the change
  - discuss Enforcement Mode (advisory is great for trying out new changes)
