#
#Copyright (c) 2016. PEREIRACH. All Rights Reserved.
#
#Redistribution and use in source and binary forms, with or without modification,
#are permitted provided that the following conditions are met:
#
#1. Redistributions of source code must retain the above copyright notice, this
#list of conditions and the following disclaimer.
#
#2. Redistributions in binary form must reproduce the above copyright notice,
#this list of conditions and the following disclaimer in the documentation and/or
#other materials provided with the distribution.
#
#3. Neither the name of the copyright holder nor the names of its contributors
#may be used to endorse or promote products derived from this software without
#specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
#ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
#ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Require Access to TELentice Monitor Server & Map a T: drive on the machine that this script is running on
# \\192.168.20.200\d$\TELenticeData\Monitor\Reports
Copy-Item T:\ConnectionStatus.702.xml -Destination C:\TELenticeData\log
$myXml = [xml] (Get-Content C:\TELenticeData\log\ConnectionStatus.702.xml)
$myLID = Read-Host "Please Enter Location ID String or part thereof: "
$myXml.DocumentElement.ChildNodes | Where-Object { $_.LID.Contains($MyLID) } | Select LID,HN,PID,M,AIP,LM,PV,SUS,SSD1,SSD6,SSD0,CS | Out-GridView

###$myXml.DocumentElement.ChildNodes | Where-Object { $_.LID.Contains($MyLID) } | Select LID,HN,PID,AIP,SSD0,CS | Out-GridView
##$myXml.DocumentElement.ChildNodes | Where-Object { $_.LID.Contains($MyLID) } | Select AIP, SSD0, HN, PID, LID | Out-GridView
##$myXml.DocumentElement.ChildNodes | Where-Object { $_.LID.Contains($MyLID) } | Select LID,HN,PID,AIP,PV,SSD0 | Out-GridView