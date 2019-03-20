# Sandeep's VS Code Maven Setup [\[Depreciated\]](https://github.com/SunnySoldier357/VSCode-Setup#Depreciated)

## Introduction

The script included in the repository installs Maven and
sets up the required environment variables necessary to run
Maven Projects in VS Code. The repository also
automatically detects Java JDKs to use to build Maven
projects. The script finally installs the appropriate
extension in VS Code so the user only has to run the script
and the Java development is setup for VS Code.

## Requirements

The script requires VS Code to already be installed (System
or User) as well as Java. If none of these are installed,
install them before running the script.

## Directions for VS Code

### Creating a new Project

1. Press **Ctrl + Shift + P** to open up Command Palette.
2. Type *maven* and select the *Generate from Maven*
   *Archetype* option.
3. A drop down list will pop-up at the top of the screen.
   Always select the *maven-archetype-quickstart* options
   (the 1st one).

![Step 3 to generate new project](https://github.com/SunnySoldier357/VSCode-Setup/blob/master/Images/step3.PNG)

4. A terminal will then pop up that will download a bunch
   of libraries on the first run.

5. After the terminal is done downloading, it will ask for
   4 options to create your project:

   * *groupId*
   * *artifactId*
   * *version*
   * *package*
   
   Unless you know what these values mean, name
   *groupId* the package of your project (all
   lowercase) and name the *artifactId* the name
   of your project (will also be used as the
   folder name). Keep the defaults for *version*
   and *package* by hitting enter. Finally hit
   enter to confirm all of the configuration settings.

![Step 5 to generate new project](https://github.com/SunnySoldier357/VSCode-Setup/blob/master/Images/step5.PNG)

6. After that run this line in the terminal to open up that
   folder in VS Code. Replace *<project_name>* with the value
   you entered as the artifactId.
   
   `code -r <project_name>`

   If you cannot remember the name, open the folder
   manually (**Ctrl + K Ctrl + O**).

### Running and debugging a Project

1. In order to build a project. VS Code required some
   configuration which is automatically generated the first
   time you run the project. To run the project, click the
   Debug panel and select the green run button. VS Code
   should generate a file after a while and once the file
   is generated, pressing the green run button will run the
   project.

![Step 1 to run new project](https://github.com/SunnySoldier357/VSCode-Setup/blob/master/Images/debug.PNG)

2. The project outputs all its information into the *Debug*
   *Console*. If this window is closed, click on the bottom
   left most button which look like error indicators and
   switch to the *Debug Console* tab.

![Step 2 to run new project](https://github.com/SunnySoldier357/VSCode-Setup/blob/master/Images/debug2.PNG)

3. If the project required input, the *Debug Console* does
   not allow it and the configuration file for running the
   project needs to be changed. In order to open this file,
   go back to the Debug Panel and click the gear icon next
   to the green run button.

4. Edit the *console* tag for the very first set of
   configurations. Replace the *console* with
   **integratedTerminal** instead of **internalConsole**.

![Step 4 to run new project](https://github.com/SunnySoldier357/VSCode-Setup/blob/master/Images/debug4.PNG)

5. The project will run in the Integrated Terminal which can
   be opened up by pressing **Ctrl + `**. The Integrated
   Terminal allows for input to be entered as well.

#### Tips

* Press **F5** to run the project.
* Press **Ctrl + F5** to run the project without hitting
    any breakpoints.

## More Information

The official [VS Code Documentation](https://code.visualstudio.com/docs).

## Depreciated

Maven can now be installed using [Chocolatey](https://chocolatey.org/)
which makes it much more stable and easier to update to the
latest Maven version as well. The steps to making a Maven
project, however, are still the same.
