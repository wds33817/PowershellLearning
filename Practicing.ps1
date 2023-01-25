$data = @('Zero', 'Zero jam', 'Zero jam def', 'Zero qpy')

Write-Host $data.Count

$test = 'Zero'
foreach ($item in $data) {
    Write-Host $test.Contains($item)
}

Write-Host($data.Contains('Zero'))


$data1 = 'Zero', 'One', 'Two', 'Three'

$data1 | ForEach-Object {"Item: [$PSItem]"}
# $PSItem same thing as $_

$data1 | ForEach-Object {"Item: [$_]"}

Write-Host $data1[$data1.Count].GetType()
Write-Host $data1[$data1.Count - 1].GetType()

$data1[-1]
$data1.GetUpperBound(0)  #get the max index number
$data1[4]

$data = 'Zero','One','Two','Three'
$data | ForEach-Object {"Item: [$PSItem]"}
# $_ is the same thing as the $PSItem
$data | ForEach-Object {"Item: [$_]"}

foreach ($node in $data) {
    "Item: $node"
}

Write-Host "--------------------"
$data.ForEach({"Item [$PSItem]"})
Write-Host "**********************"
$data.ForEach{"Item [$PSItem]"}
Write-Host "^^^^^^^^^^^^^^^^^^^^^^^^^^"
for ($i = 0; $i -lt $data.Count; $i++) {
    "Item: {0}" -f $data[$i]
}


$data = 'Zero','One','Two','Three'
switch( $data )
{
    'One'
    {
        'Tock'
    }
    'Three'
    {
        'Tock'
    }
    Default
    {
        'Tick'
    }
}


for ( $index = 0; $index -lt $data.count; $index++ )
{
    $data[$index] = "Item: [{0}]" -f $data[$index]
}

$data


$data = @(
    [pscustomobject]@{FirstName='Kevin';LastName='Marque'}
    [pscustomobject]@{FirstName='John';LastName='Doe'}
)

$data | select -ExpandProperty LastName 

$processList = Get-Process

$data[1].FirstName = 'Jay'

$data[1]

Write-Host "^^^^^^^^^^^^^^^^^^^^^^^^^^"

$data = @(
    [pscustomobject]@{FirstName='Kevin';LastName='Marque'}
    [pscustomobject]@{FirstName='John';LastName='Doe'}
)
$data | ForEach-Object {$_.LastName}

$data | % {$_.LastName}  # % ForEach-Object 

$data | ? LastName -eq 'Doe' # ? Where-Object -eq 'Doe'

$data | fl *       # fl format-list

$data | Select-Object -ExpandProperty LastName

Get-Process Explorer | Select -Property ProcessName -ExpandProperty Modules | fl


Get-Command -Verb get | ft

Get-Command -Verb get | fl

Get-Command -Noun computer | ft

get-help * | more

get-help gps -Detailed  # get-process.


get-help gps -Parameter i*


"apple" -eq "apple"
True



"apple" -eq "apple abc"
False

8 -gt 8  # greater than
False

8 -ge 8
True

8 -le 8
True

"windows powershell" -like "*shell"   # Like—Match using the wildcard character (*).
True

"Windows PowerShell", "Server" -notlike "*shell"
Windows PowerShell

'Ziggy stardust' -match 'Z[xyi]ggy'
'Ziggy stardust' -match 'Zigg[x-z] Star'
'abc' -Notmatch '[^ijk-xyz]'  #Match anything but these characters, specify in one or more contiguous ranges [^n-m]


Match only if at the beginning of the line: ^
'no alarms and no surprises' -replace '^no',''
alarms and no surprises


Match only if at the end of the line: $
PS C:> 'There must be some way out of here said the joker to the joker' -replace 'joker$','thief'
There must be some way out of here said the joker to the thief


$coll = 'one abfc','one','one abfc eee','one eee'
# Contains is an exact (but case-insensitive) match and will ignore wildcards.

#To examine the contents of values within a string, either use a wildcard -match or -split the string into an array.

#This operator returns True or False.
if ($coll -contains 'ONE') { 
    Write-Host 'it has one'
}


$string = 'alpha, beta, California'
$string -NOTcontains 'alpha'

$string -split ',' -contains 'alpha'


#Contains operator, -ccontains case sensitive 
$noun = “cat”,”dog”,”rabbit”
$noun -ccontains “Rabbit”
False

$noun = “cat”,”dog”,”rabbit”
$noun -ccontains “rabbit”
True


"apple" -in "Apple","juice","mango"
True

"apple" -cin "Apple","juice","mango"
False

"Apple" -cin "Apple","juice","mango"
True

"abc" -cnotin "ABC", "oip"
True

"abc" -notin "ABC", "oip"
False

$a = 5
$a -is [int]


"abcdef" -replace "dEf","xyz"
abcxyz
"abcdef" -creplace "dEf","xyz"
abcdef

Get-Service | ? {$_.Name -clike "xbox*"}   # case-sensitive match

Do {Write-Host $c.GetType(); $c++ ; Write-Host $c; Write-Host $c.GetType(); } while($c -lt 5)

$b.GetType()


$Count = 1
do {Write-Host $Count; $Count++}
until ($Count -gt 5)
1
2
3
4
5
# The Do-Until loop executes the statement list until the condition is false. Once the condition evaluates to be true, the loop exits.


$Numbers = "1","2","3","4","5"; foreach ($No in $Numbers) {Write-Host $No}
1
2
3
4
5


$Fruit = @("Apple","Peach","Banana","Strawberry"); foreach ($f in $Fruit) { "$f = " + $f.length }
Apple = 5
Peach = 5
Banana = 6
Strawberry = 10



foreach ($item in Get-ChildItem)
{
        Write-Host $item
}




# ne is a comparison operator that will test if one numeric or string expression is NOT equal to another,
while ($value -ne 9)
  {
  $value++
  Write-Host $value
  }
1
2
3
4
5
6
7
8
9





$Array = 34, 56, 2, 23, 8

$Number = 1..5
$Number.GetType()

#IsPublic IsSerial Name                                     BaseType                          
#-------- -------- ----                                     --------                          
#True     True     Object[]                                 System.Array     


$MultiDimArray = @(
             (4,5,6),
             (24,30,36)
   )

Foreach ($item in $Array) {$item}
34
56
2
23
8
$Array.SetValue(34,2)

$Array
34
56
34
23
8

#Arrays can be deleted by assigning the value of $null to the array; for example, $array = $null.


Get-service | ? {$_.status -eq "stopped"}
# => Get-service | Where-Object {$_.status -eq "stopped"}


Get-service | ? {($_.status -eq "running") -and ($_.Name -like "win*")}

# Get all processes
$procs = Get-Process

# Get just one process
$proc = Get-Process | Select -first 1

# Check it
$procs -contains $proc
This will almost always be False. That's because in the time it takes to run the second command, the first process has changed. Its memory, CPU, or some other value has changed. Although $procs does contain the same actual process as $proc, not every single property is exactly the same in both instances. So -contains can't detect the match.



get-process | sort id, cpu  =>  get-process | sort-object id, cpu



get-process | sort -Property processname, cpu |format-list
get-process | sort -Property processname, cpu |ft


get-process | Select-Object -Property processname, cpu |ft
=> get-process | select -Property processname, cpu |ft
=> get-process | Select -Property processname, cpu |ft

get-process | Select -Property processname -Unique => (Will give unique name for processname)
-Unique is another parameter of Select-Object


 get-service > service.txt
 select-string -path .\service.txt -Pattern network, windows
 select-string => grep or findstr in windows.
 
 




