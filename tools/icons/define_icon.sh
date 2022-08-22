# Create a defined environment variable for an icon
# e.g. 
# define_icon BLOCK 1FB85

define_icon(){

    ICON=$(./tools/icons/unicodeToEmoji.sh $2)
    export declare $1=${ICON}
    
}