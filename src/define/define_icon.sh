# Create a defined environment variable for an icon
# e.g. 
# define_icon BLOCK 1FB85

define_icon(){

    ICON=$(${SPINNAKER_TOOLS_FOLDER}/icons/unicodeToEmoji.sh $2)
    export declare $1=${ICON}
    
}