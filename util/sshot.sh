#!/bin/zsh
# sshot.sh | Curtis Free (http://curtisfree.com)
# This script is used to take screenshots using ImageMagick's
# import utility.

# Some credits:
# -------------
# man import
# http://tips.webdesign10.com/how-to-take-a-screenshot-on-ubuntu-linux

# Dependency check.
if ! which import 2>&1 >/dev/null; then
    echo "Error: ImageMagick must be installed.
If it is, ensure that the 'import' utility is in your \$PATH"
    exit 2
fi

# Check that the proper number of arguments was given.
if [ $# != 2 ]; then
    echo "usage: $0 <shot_type> <filename>"
    exit 1
fi

# Nice var names.
shot_type=$1
filename=$2

# Check to see if a directory was specified.
if [ -d $filename ]; then
    echo "$filename is a directory. Please re-specify."
    exit 1

# Check to see if the file already exists.
elif [ -f $filename ]; then

    # If it does, check to see if the user wishes to overwrite.
    echo -n "$filename already exists. Overwrite? [N] "
    read overwrite

    # If not, exit.
    if ! [[ $overwrite =~ ^[yY]+ ]]; then
        exit 0
    fi

    unset overwrite # Cleanup.
fi

# Check screenshot type.
case $shot_type in
    # Full-screen.
    root)
        echo "Taking full-screen shot..."
        import_args="-window root"
        ;;
    # Individual window.
    window)
        echo "Click the desired window."
        import_args="-screen" # With no extra args, the window contents are black.
        ;;
    # Selection.
    select)
        echo "Click and drag across the desired area."
        import_args="" # None needed.
        ;;
    # Other = error.
    *)
        echo "Error: Unrecognized shot type."
        exit 1
esac

# Take the screenshot. (import doesn't like $import_args.)
if eval "import -frame $import_args $filename"; then

    # If successful, show success msg.
    echo "Done. (Shot: $filename)"

# On error, print error msg.
else
    echo "Error: There was an error creating the screenshot."
    exit 1
fi

# Ensure exit 0.
exit 0

