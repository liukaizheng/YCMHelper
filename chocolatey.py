import subprocess

def checkCall(args, **kwargs):
    try:
        subprocess.run(args, shell = True)
    except subprocess.CalledProcessError as error:
        print(error)

checkCall(["mkdir", "build"])
checkCall(["cd", "build"])
checkCall(["cmake", ".."])

