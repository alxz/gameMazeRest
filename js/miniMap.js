
  // var arrMazeInit = <?php echo $arrMazeInit ?>;
  // var mazeQuestionsArr = <?php echo $mazeQuestionsArr ?>; //questions and answers JSON array
  // var mazeWDrsRms =<?php echo $mazeWithRoomsDoors ?>;
  //var startTime, endTime;

  //startTimer(); //to start the timer event
  //showMaze(arrMazeInit, "mazeMap");
  //showMazeGfx(mazeWDrsRms, "mazeWDrsRmsMap");
  //showMazeObj(mazeQuestionsArr, "mazeQeustions");


        function showMaze (mazePassed,targetId) {
          //here we are going to display the maze table/array
          //const mazeDiv = document.getElementById("mazeMap");
          const mazeDiv = document.getElementById(targetId);
          var maze = mazePassed;
          mazeDiv.innerHTML = "MAP: "+targetId+ "<br>"+makeTableHTML(maze);
          // document.getElementById(mazePassed).className = "mazeContainerLeft";
            //mazeDiv.innerHTML = `${numCorrect} out of ${myQuestions.length}`;
        }

        function makeTableHTML(myArray) {
            var result = "<table id='table1' class='myTable'>";
            for(var i=0; i<myArray.length; i++) {
                result += "<tr>";
                for(var j=0; j<myArray[i].length; j++){
                  if ((i == posY) & (j == posX)) {
                    result += "<td>X</td>";
                  } else {
                    result += "<td>"+myArray[i][j]+"&nbsp; </td>";
                  }

                }
                result += "</tr>";
            }
            result += "</table>";
            return result;
        }

        function showMazeGfx (mazePassed,targetId) {
          //here we are going to display the maze table/array
          //const mazeDiv = document.getElementById("mazeMap");
          const mazeDiv = document.getElementById(targetId);
          var maze = mazePassed;
          mazeDiv.innerHTML = "Where are you now: "+ "<br>"+makeTableHTMLGfx(maze);
          // document.getElementById(mazePassed).className = "mazeContainerLeft";
            //mazeDiv.innerHTML = `${numCorrect} out of ${myQuestions.length}`;
        }

        function makeTableHTMLGfx(myArray) {
            var result = "<pre><table id='tableMiniMap'>";
            var resultStr ="";
            for(var i=0; i<myArray.length; i++) {
                result += "<tr>";
                for(var j=0; j<myArray[i].length; j++){
                    //result += "<td>"+myArray[i][j]+"</td>";
                    var obj = new Object(myArray[i][j]);
                    for(var key in obj)
                    {
                      var value = obj[key];
                      resultStr += (key.toLowerCase() + value + '');
                    }
                    tabCellXId = 'y' + i + 'x' + j;
                    result += '<td class="miniMapTD" id="' + tabCellXId + '"><img src="./jpg/minimap/'+ resultStr +'.jpg" alt="[]" height="20" width="30"></td>';
                    resultStr = "";
                }
                result += '';
            }
            result += "</table></pre>";
            return result;
        }

        function showMazeObj (mazePassed,targetId) {
          //here we are going to display the maze table/array
          //const mazeDiv = document.getElementById("mazeMap");
          const mazeDiv = document.getElementById(targetId);
          var maze = mazePassed;
          mazeDiv.innerHTML = "MAP: "+targetId+ "<br>"+makeTableHTMLObj(maze);
          // document.getElementById(mazePassed).className = "mazeContainerLeft";
            //mazeDiv.innerHTML = `${numCorrect} out of ${myQuestions.length}`;
        }

        function makeTableHTMLObj(myArray) {
            var result = "<table id='table1' class='myTable' style='width: 90%;'>";
            var resultStr = "";
            for(var i=0; i<myArray.length; i++) {
                result += "<tr>";
                for(var j=0; j<myArray[i].length; j++){
                  //  result += "<td>"+myArray[i][j]+"&nbsp; </td>";
                  var obj = new Object(myArray[i][j]);
                  if (obj.qId == '-1') {
                    result = result + '<td> This room is EMPTY';
                    result += resultStr + '</td>';
                    resultStr = "";
                  } else {
                    result = result + '<td>';
                    resultStr = resultStr + 'Qid: ' + obj.qId + '; Text: ' + obj.qTxt + ' <br>';
                    resultStr = resultStr + 'validAnswer: ' + (parseInt(obj.validAnswer)+1)  + ' <br>' + ' listAnswers:<br>';

                    for (let key in obj.listAnswers) {
                      let value = obj.listAnswers[key];
                      //console.log(key, value);
                      resultStr = resultStr + 'Answer [' + (value.key) + '] value: ' + value.value + '<br>';
                    }
                    result += resultStr + '</td>';
                    resultStr = "";
                  }
                }
                result += "</tr>";
            }
            result += "</table>";
            return result;
        }

    //calculate time elapsed:
          function startTimer() {
            startTime = new Date();
          };

          function endTimer() {
            endTime = new Date();
            var timeDiff = endTime - startTime; //in ms
            // strip the ms
            timeDiff /= 1000;

            // get seconds
            var seconds = Math.round(timeDiff);
            //console.log(seconds + " seconds");
            return seconds;
          }
