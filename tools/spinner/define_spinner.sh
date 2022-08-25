# Create a defined environment variable for a spinner
# e.g. 
# define_spinner NAME SIZE

define_spinner(){

    NAME=$1
    SPINNER_PARTS=$2

    export declare $NAME=${SPINNER_PARTS}
    
}