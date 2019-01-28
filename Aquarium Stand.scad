//Units are in Inches
wood = [ 1.5, 3.5, 96 ]; //2x4 8 foot
aquarium = [48.25, 18.25, 19.75]; //75 gallon
stand = [aquarium.x + 1, aquarium.y + 1, 28];

middleSupports = false;
drawAquarium = false;

module base( move ) {
    wood_long = [ stand.x, wood.x, wood.y ];
    wood_short = [  wood.x, stand.y - (2*wood.x), wood.y ];

    translate( move ){
        color( "Sienna" ) cube( wood_long );
        translate( [0, stand.y - wood.x, 0]) color( "Sienna" ) cube(wood_long);
        translate( [ 0, wood.x, 0]) color( "green" ) cube( wood_short);
        translate( [ stand.x - wood.x, wood.x, 0]) color( "green" ) cube( wood_short);
        
        
        echo("Long Base", wood_long.x);
        echo("Long Base", wood_long.x);
        echo("Short Base", wood_short.y);
        echo("Short Base", wood_short.y);
    }
}

module uprights( move ){
    dimension = [wood.y, wood.x, stand.z];
    
    color( "yellow" ) 
    translate( move ) 
    cube( dimension );
    
    echo("Uprights", dimension.z);
}

module supports( move, rotate ){
    dimension = [wood.x, wood.y, stand.z - 2* wood.y ];
    
    color( rotate ? "hotpink" : "orangered" ) 
    translate( move )
    rotate( rotate )
    cube( dimension );
    
    echo("Support", dimension.z);
}

module crossBrace( move ){
    dimension = [ wood.x, stand.y - (2*wood.x), wood.y ];
    
    color( "lime")
    translate( move )
    cube( dimension );
    
    echo("Cross Brace", dimension.y);
}

base( [0,0,0] );
base( [0,0,stand.z - wood.y] );

uprights( [wood.x, wood.x, 0]);
uprights( [wood.x, stand.y - (2*wood.x) , 0]);
uprights( [stand.x - wood.x - wood.y, wood.x, 0] );
uprights( [stand.x - wood.x - wood.y, stand.y - (2*wood.x), 0] );

supports( [0, 0, wood.y] );
supports( [0, stand.y - wood.y, wood.y] );
supports( [stand.x - wood.x, 0, wood.y] );
supports( [stand.x - wood.x, stand.y - wood.y, wood.y] );
supports( [wood.x, wood.x, wood.y], [0,0,-90] );
supports( [wood.x, stand.y, wood.y], [0,0,-90] );
supports( [(stand.x - wood.y - wood.x), wood.x, wood.y], [0,0,-90] );
supports( [(stand.x - wood.y - wood.x), stand.y, wood.y], [0,0,-90] );

crossBrace([ wood.x + wood.y, wood.x, 0 ]);
crossBrace([ stand.x - (2*wood.x + wood.y), wood.x, 0 ]);
crossBrace([ wood.x + wood.y, wood.x, stand.z - wood.y ]);
crossBrace([ stand.x - (2*wood.x + wood.y), wood.x, stand.z - wood.y ]);

if( middleSupports ){
    middlePoint = (stand.x - wood.y)/2;
    
    uprights( [ middlePoint, wood.x, 0]);
    uprights( [ middlePoint, stand.y - (2*wood.x) , 0]);
    
    supports( [ middlePoint, wood.x, wood.y], [0,0,-90] );
    supports( [ middlePoint, stand.y, wood.y], [0,0,-90] );
    
    crossBrace([ middlePoint - wood.x, wood.x, 0 ]);
    crossBrace([ middlePoint + wood.y, wood.x, 0 ]);
    crossBrace([ middlePoint - wood.x, wood.x, stand.z - wood.y ]);
    crossBrace([ middlePoint + wood.y, wood.x, stand.z - wood.y ]);
}

if( drawAquarium ) translate( [(stand.x-aquarium.x)/2, (stand.y-aquarium.y)/2, stand.z] ) color("lightblue") cube(aquarium);
    

