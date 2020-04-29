param([int32]$NumbertoEvaluate=1000)
#In PowerShell:
#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

#Set the values for the denominators (a,b - 3,5) and initialize the Counter for the while loop (c)
$a = 3
$b = 5
$c = 1

#create an array to store all of the multiples of 3 or 5 for review
$numarray = @()

#declare the variable 'sum' to store the solution
$sum = 0

#start the loop structure until the counter reaches 1000

while($c -lt $NumbertoEvaluate)
    {

        #divde the current count by 3 and store in the 'test3' variable
        $test3 = $c/$a
        #divide the current count by 5 and store in the 'test5' variable
        $test5 = $c/$b

        #PowerShell's default number type is '[int32]' so we can simply create logic check if either 'test3' or 'test5' results in a whole number without decimal
        
        #if the number can not be divided by 3 or 5, powershell will automatically cast the result to a different number type to correctly represent the output (system.double by default) 
        if(
               ($test3.GetType() -eq [int32]) -or ($test5.GetType() -eq [int32])
           )
            {
               
                
                #generate a custom object to store any number that qualifies and flag which number it's a multiple of (can be fun to review the various patterns that result)
                $psobj = new-object psobject -Property `
                    @{
                        Value=$c
                        MultipleOf3=($test3.GetType() -eq [int32])
                        Multipleof5=($test5.GetType() -eq [int32])

                    }
                

                #add the object to the 'numarray'
                $numarray +=$psobj
                #add the number to the sum calculation
                $sum +=$c
             
                 
              
            }
        
        #increment the counter by 1
        $c++
          
    }
    #generate an object that holds both the value of the SUM and the array of numbers that match the requirements
 $output = New-Object psobject -Property `
            @{
                Values=$numarray
                Sum=$sum

            }
        $output