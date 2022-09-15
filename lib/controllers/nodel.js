'use strict';

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', function(inputStdin) {
    inputString += inputStdin;
});

process.stdin.on('end', function() {
    inputString = inputString.split('\n');

    main();
});

function readLine() {
    return inputString[currentLine++];
}

/*
 * Complete the 'miniMaxSum' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

function miniMaxSum(arr) {
    var minSum=0;
    var maxSum=0;
   
    for(var i=0;i<arr.length;i++){
         var sum=0;
        for(var j=0;j<arr.length;j++){
            if(i!==j)
            sum=sum+arr[j];
        }
        if(maxSum===0){
            maxSum=sum;
            minSum=sum;
            
        }
        if(sum>maxSum){
           var newSum=maxSum;
            maxSum=sum;
            minSum=newSum;
        }
        else if(sum<maxSum){
            minSum=sum;
        }
        else{
            minSum=maxSum;
        }
    }
    console.log(minSum+" "+maxSum);
   
}

function main() {

    const arr = readLine().replace(/\s+$/g, '').split(' ').map(arrTemp => parseInt(arrTemp, 10));

    miniMaxSum(arr);
}
