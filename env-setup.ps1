#* This script sets up Maven and necessary environment variables in order for
#* Java to run in VS Code. The scripts copies a pre-downloaded Maven file to
#* the requested Maven installation location. It also checks for Java on the
#* machine.

Write-Output "~~~ Weclome to Sandeep's VS Code Setup Script ~~~";
Write-Output "";

# Checking if VSCode is installed
$systemPath = [System.Environment]::GetEnvironmentVariable("PATH",
    [System.EnvironmentVariableTarget]::Machine);

$userPath = [System.Environment]::GetEnvironmentVariable("PATH",
    [System.EnvironmentVariableTarget]::User);

if (($userPath -And !$userPath.ToLower().Contains("code")) -or ($systemPath -And !$systemPath.ToLower().Contains("code")))
{
    Write-Warning "Please Install VS Code first!";
}
else
{
    # Copy Maven to requested installation location if it does not exist
    $mavenPath = Read-Host "Enter preferred installation location for Apache Maven";

    if (!(Test-Path ($mavenPath + "\apache-maven**") -PathType Container))
    {
        Copy-Item ".\apache-maven**" $mavenPath -Recurse;
    }

    $mavenHomePath = Get-ChildItem ($mavenPath + "\apache-maven**");

    # Setting Environment Variables for Maven
    [System.Environment]::SetEnvironmentVariable("M2_Home", $mavenHomePath,
        [System.EnvironmentVariableTarget]::User);
    [System.Environment]::SetEnvironmentVariable("M2", "%M2_HOME%\bin",
        [System.EnvironmentVariableTarget]::User);
    [System.Environment]::SetEnvironmentVariable("MAVEN_OPTS", "-Xmx256m -Xmx512m",
        [System.EnvironmentVariableTarget]::User);

    [System.Environment]::SetEnvironmentVariable("PATH", $userPath + ";%M2%",
        [System.EnvironmentVariableTarget]::User);

    # Detecting if Java JDK is installed
    $javaCountx32 = (Get-ChildItem "C:\Program Files (x86)\Java\jdk**").Count;
    $javaCountx64 = (Get-ChildItem "C:\Program Files\Java\jdk**").Count;

    if (($javaCountx32 -gt 0) -or ($javaCountx64 -gt 0))
    {
        $is64Bit = $javaCountx64 -gt 0;

        if (($javaCountx32 -gt 1) -or ($javaCountx64 -gt 1))
        {
            if ($is64Bit)
            {
                Get-ChildItem "C:\Program Files\Java\jdk**";
            }
            else
            {
                Get-ChildItem "C:\Program Files (x86)\Java\jdk**";
            }
            
            $javaHome = Read-Host "Please choose a JDK version to use with VS Code: ";
         
            if ($is64Bit)
            {
                $javaHome = "C:\Program Files\Java\" + $javaHome;
            }
            else
            {
                $javaHome = "C:\Program Files (x86)\Java\" + $javaHome;
            }
            
            [System.Environment]::SetEnvironmentVariable('JAVA_HOME', $javaHome,
                [System.EnvironmentVariableTarget]::User);
        }
        else
        {
            $javaHome = "";
         
            if ($is64Bit)
            {
                $javaHome = Get-ChildItem "C:\Program Files\Java\jdk**";
            }
            else
            {
                $javaHome = Get-ChildItem "C:\Program Files (x86)\Java\jdk**";
            }
            
            [System.Environment]::SetEnvironmentVariable('JAVA_HOME', $javaHome,
                [System.EnvironmentVariableTarget]::User);
        }
    }
    else
    {
        Write-Warning "Java JDKs could not be found in default locations! If Java" +
        "is installed in a different location other than 'Program Files\Java'" +
        " or 'Program Files (x86)\Java', please enter the location of Java " +
        "JDK or install it and run this script again."
        $javaHome = Read-Host "Enter location of Java JDK (Ctrl + C to exit): ";

        [System.Environment]::SetEnvironmentVariable('JAVA_HOME', $javaHome,
            [System.EnvironmentVariableTarget]::User);
    }

    Write-Output "";
    Write-Output "VS Code has been successfully set up!";
    $setupExts = Read-Host "Do you want to also install the Java VS Code extension (y/n)";
    if ($setupExts.ToLower().Contains("y"))
    {
        code --install-extension "vscjava.vscode-java-pack";
    }
}

Read-Host "Press enter to exit";