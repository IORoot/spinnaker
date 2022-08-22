# Create a defined environment variable for padding
# e.g. 
# define_padding NAME SIZE

define_padding(){

    NAME=$1
    SIZE=$2

    export declare $NAME=${SIZE}
    
}