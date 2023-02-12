<html>

<head>
    <link rel="stylesheet" href="styles.css">
    <title>CPSC 304 POKÉDEX</title>
    <h1>Mini Pokédex</h1>
    <h2>Made by Andrew Chan, Terry Lin and Tianne Lee</h2>
</head>

<body>
    <div>
        <input type="radio" name="tabs" id="tab0" checked />
        <label for="tab0">Display</label>
        <input type="radio" name="tabs" id="tab1" />
        <label for="tab1">Insert</label>
        <input type="radio" name="tabs" id="tab2" />
        <label for="tab2">Delete</label>
        <input type="radio" name="tabs" id="tab3" />
        <label for="tab3">Update</label>
        <input type="radio" name="tabs" id="tab4" />
        <label for="tab4">Selection</label>
        <input type="radio" name="tabs" id="tab5" />
        <label for="tab5">Projection</label>
        <input type="radio" name="tabs" id="tab6" />
        <label for="tab6">Join</label>
        <input type="radio" name="tabs" id="tab7" />
        <label for="tab7">Group By</label>
        <input type="radio" name="tabs" id="tab8" />
        <label for="tab8">Having</label>
        <input type="radio" name="tabs" id="tab9" />
        <label for="tab9">Nested Group By</label>
        <input type="radio" name="tabs" id="tab10" />
        <label for="tab10">Division</label>

        <!-- tab 0: Display -->
        <div class="tab content0">
            <h2>Display Titles of all Tables</h2>
            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="displayTitlesRequest" name="displayTitlesRequest">
                <input type="submit" value="Display" name="displayTitles"></p>
            </form>

            <h2>Display Tuples in Requested Table</h2>
            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="displayTuplesRequest" name="displayTuplesRequest">
                Table Name: <input type="text" name="disName"> <br /><br />

                <input type="submit" value="Display" name="displayTuples"></p>
            </form>
        </div>

        <!-- tab 1: Insert -->
        <div class="tab content1">
            <h2>Add a new Pokémon to the Pokédex</h2>
            <p>Discovered a new Pokémon? Add it to the Pokédex!</p>
            <form method="POST" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="insertQueryRequest" name="insertQueryRequest">
                New Pokémon ID: <input type="text" name="insID"> <br /><br />
                Pokémon Species Name: <input type="text" name="insName"> <br /><br />
                Pokémon Nickname: <input type="text" name="insNickname"> <br /><br />
                Pokémon Region: <select name="insRegion">
                    <option value="">Choose a region</option>
                    <option value="Kanto">Kanto</option>
                    <option value="Johto">Johto</option>
                    <option value="Hoenn">Hoenn</option>
                    <option value="Sinnoh">Sinnoh</option>
                    <option value="Unova">Unova</option>
                    <option value="Kalos">Kalos</option>
                    <option value="Alola">Alola</option>
                </select> <br /><br />

                <input type="submit" value="Insert" name="insertSubmit"></p>
            </form>
        </div>

        <!-- tab 2: Delete -->
        <div class="tab content2">
            <h2>Delete a retired Gym Leader from the pokedex</h2>
            <p>
            <p>The values are case sensitive and if you enter in the wrong case, it will not do anything.</p>
            <form method="POST" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="deleteGlRequest" name="deleteGlRequest">
                Gym Leader's name: <input type="text" name="GLname"> <br /><br />
                Gym Leader's Gym: <input type="text" name="GLgym"> <br /><br />

                <input type="submit" value="Delete" name="deleteGL"></p>
            </form>
        </div>

        <!-- tab 3: Update -->
        <div class="tab content3">
            <h2>Update a Gym's number of trainers in the Pokédex.</h2>
            <p>The values are case sensitive and if you enter in the wrong case, the update statement will not do anything.</p>

            <form method="POST" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="updateQueryRequest" name="updateQueryRequest">
                Gym name: <input type="text" name="gym"> <br /><br />
                New number: <input type="text" name="gymNumberOfTrainers"> <br /><br />

                <input type="submit" value="Update" name="updateSubmit"></p>
            </form>
        </div>

        <!-- tab 4: Selection -->
        <div class="tab content4">
            <h2>See all Pokémons in a specific generation.</h2>

            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="displayGenRequest" name="displayGenRequest">
                <p>Which generation would you want to select?</p>
                <select name="generation">
                    <option value="">Choose a Generation</option>
                    <option value="1">Generation 1</option>
                    <option value="2">Generation 2</option>
                    <option value="3">Generation 3</option>
                    <option value="4">Generation 4</option>
                    <option value="5">Generation 5</option>
                    <option value="6">Generation 6</option>
                    <option value="7">Generation 7</option>
                </select>
                <input type="submit" value="Select">
            </form>
        </div>

        <!-- tab 5: Projection -->
        <div class="tab content5">
            <h2>Project a column from Pokemon table</h2>
            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="projectionRequest" name="projectionRequest">
                <p>Which column would you want to project on?</p>
                <select name="projection">
                    <option value="">Choose a Column to project on</option>
                    <option value="ID">ID</option>
                    <option value="NICKNAME">Nickname</option>
                    <option value="PNAME">Pokemon name</option>
                    <option value="RNAME">Region</option>
                </select>
                <input type="submit" value="Project">
            </form>
        </div>

        <!-- tab 6: Join (?) -->
        <div class="tab content6">
            <h2>Display effects of items that a Pokémon is holding.</h2>
            <p>The values are case sensitive and if you enter in the wrong case, it will not do anything.</p>
            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="displayItemsRequest" name="displayItemsRequest">
                Pokémon ID: <input type="text" name="disID"> <br /><br />
                Pokémon nickname: <input type="text" name="disNickname"> <br /><br />

                <input type="submit" value="Display" name="DisplayItems"></p>
            </form>
        </div>

        <!-- tab 7: Group by -->
        <div class="tab content7">
            <h2>Group by region in table Pokemon</h2>
            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <p>Which column would you want to project on?</p>
                <p>*Note choose Region to get the best group by result*</p>
                <input type="hidden" id="groupByRequest" name="groupByRequest">
                <select name="groupBy">
                    <option value="">Choose a Column to Group By</option>
                    <option value="ID">ID</option>
                    <option value="NICKNAME">Nickname</option>
                    <option value="PNAME">Pokemon name</option>
                    <option value="RNAME">Region</option>
                </select>
                <input type="submit" value="Select">
            </form>
        </div>

        <!-- tab 8: Having -->
        <div class="tab content8">
            <h2>Group by region where Pokemon count is greater than a number</h2>
            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="havingRequest" name="havingRequest">
                Group by region where Pokemon count is greater than: <input type="text" name="num"> <br /><br />

                <input type="submit" value="submit" name="having"></p>
            </form>
        </div>

        <!-- tab 9: Nested group by -->
        <div class="tab content9">
            <h2>Find the pokémon with at least as many moves as this number.</h2>
            <p>You should pick at least 1. The pokémon with the highest number of moves is 5, for reference.</p>
            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="countMovesAtLeastRequest" name="countMovesAtLeastRequest">
                At least <input type="text" name="disMoveNum"> moves. <br /><br />
                <input type="submit" value="submit" name="submit"></p>
            </form>
        </div>

        <!-- tab 10: Division -->
        <div class="tab content10">
            <h2>Display Pokemon who holds all Pokemon Items</h2>
            <form method="GET" action="pokedex.php">
                <!--refresh page when submitted-->
                <input type="hidden" id="divRequest" name="divRequest">
                <input type="submit" value="Display" name="submit"></p>
            </form>
        </div>
    </div>

    <hr />
    <h2>Output</h2>


    <?php
    //this tells the system that it's no longer just parsing html; it's now parsing PHP

    $success = True; //keep track of errors so it redirects the page only if there are no errors
    $db_conn = NULL; // edit the login credentials in connectToDB()
    $show_debug_alert_messages = False; // set to True if you want alerts to show you which methods are being triggered (see how it is used in debugAlertMessage())


    function debugAlertMessage($message) {
        global $show_debug_alert_messages;

        if ($show_debug_alert_messages) {
            echo "<script type='text/javascript'>alert('" . $message . "');</script>";
        }
    }

    function executePlainSQL($cmdstr) { //takes a plain (no bound variables) SQL command and executes it
        //echo "<br>running ".$cmdstr."<br>";
        global $db_conn, $success;

        $statement = OCIParse($db_conn, $cmdstr);

        if (!$statement) {
            echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
            $e = OCI_Error($db_conn); // For OCIParse errors pass the connection handle
            echo htmlentities($e['message']);
            $success = False;
        }

        $r = OCIExecute($statement, OCI_DEFAULT);
        if (!$r) {
            echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
            $e = oci_error($statement); // For OCIExecute errors pass the statementhandle
            echo htmlentities($e['message']);
            $success = False;
        }

        return $statement;
    }

    function executeBoundSQL($cmdstr, $list) {
        /* Sometimes the same statement will be executed several times with different values for the variables involved in the query.
		In this case you don't need to create the statement several times. Bound variables cause a statement to only be
		parsed once and you can reuse the statement. This is also very useful in protecting against SQL injection.
		See the sample code below for how this function is used */

        global $db_conn, $success;
        $statement = OCIParse($db_conn, $cmdstr);

        if (!$statement) {
            echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
            $e = OCI_Error($db_conn);
            echo htmlentities($e['message']);
            $success = False;
        }

        foreach ($list as $tuple) {
            foreach ($tuple as $bind => $val) {
                //echo $val;
                //echo "<br>".$bind."<br>";
                OCIBindByName($statement, $bind, $val);
                unset($val); //make sure you do not remove this. Otherwise $val will remain in an array object wrapper which will not be recognized by Oracle as a proper datatype
            }

            $r = OCIExecute($statement, OCI_DEFAULT);
            if (!$r) {
                echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($statement); // For OCIExecute errors, pass the statementhandle
                echo htmlentities($e['message']);
                echo "<br>";
                $success = False;
            }
        }
    }

    function printResult($result) { //prints results from a select statement
        //echo "<br>Retrieved data from table<br>";
        echo "<table>";

        $header = true;
        while ($row = oci_fetch_assoc($result)) {
            //print header once
            if ($header) {
                echo "<tr></thead>";
                foreach (array_keys($row) as $key) {
                    print '<th>' . $key . '</th>';
                }
                echo "</tr></thead>";
                $header = false;
            }

            //print tuples
            echo "<tr>";
            foreach ($row as $key => $value) {
                echo "<td>" . $value . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }

    function connectToDB() {
        global $db_conn;

        // Your username is ora_(CWL_ID) and the password is a(student number). For example,
        // ora_platypus is the username and a12345678 is the password.
        $db_conn = OCILogon("ora_tlin05", "a65178329", "dbhost.students.cs.ubc.ca:1522/stu");

        if ($db_conn) {
            debugAlertMessage("Database is Connected");
            return true;
        } else {
            debugAlertMessage("Cannot connect to Database");
            $e = OCI_Error(); // For OCILogon errors pass no handle
            echo htmlentities($e['message']);
            return false;
        }
    }

    function disconnectFromDB() {
        global $db_conn;

        debugAlertMessage("Disconnect from Database");
        OCILogoff($db_conn);
    }

    function handleUpdateRequest() {
        global $db_conn;

        $gym = $_POST['gym'];
        $gym_number_of_trainers = $_POST['gymNumberOfTrainers'];

        // you need the wrap the old name and new name values with single quotations
        executePlainSQL("UPDATE Gym SET gym_number_of_trainers='" . $gym_number_of_trainers . "' WHERE gym='" . $gym . "'");
        OCICommit($db_conn);
        $result = executePlainSQL("SELECT * FROM Gym");
        printResult($result);
    }

    function handleInsertRequest() {
        global $db_conn;

        //Getting the values from user and insert data into the table
        $tuple = array(
            ":bind1" => $_POST['insID'],
            ":bind2" => $_POST['insNickname'],
            ":bind3" => $_POST['insName'],
            ":bind4" => $_POST['insRegion']
        );

        $alltuples = array(
            $tuple
        );

        executeBoundSQL("insert into Pokemon values (:bind1, :bind2, :bind3, :bind4)", $alltuples);
        OCICommit($db_conn);
        $result = executePlainSQL("SELECT * FROM Pokemon ORDER BY id");
        printResult($result);
    }

    function handleDeleteGlRequest() {
        global $db_conn;
        $GLname = $_POST['GLname'];
        $GLgym = $_POST['GLgym'];
        executePlainSQL("DELETE FROM GYM_LEADER WHERE TNAME = '$GLname' AND GYM = '$GLgym'");
        OCICommit($db_conn);
        $result = executePlainSQL("SELECT * FROM GYM_LEADER");
        printResult($result);
    }

    function handleCountRequest() {
        global $db_conn;

        $result = executePlainSQL("SELECT Count(*) FROM demoTable");

        if (($row = oci_fetch_row($result)) != false) {
            echo "<br> The number of tuples in demoTable: " . $row[0] . "<br>";
        }
    }

    function handleDisplayRequest() {
        global $db_conn;

        $tableName = $_GET['disName'];
        if ($tableName) {
            $string = "select * from " . $tableName;
            $result = executePlainSQL($string);
            //echo "</tr></thead>".$tableName."</tr></thead>";
            echo "<tr><thead>";
            print "<th>" . $tableName . "<th>";
            echo "</tr></thead>";
        } else {
            $result = executePlainSQL("SELECT * FROM Pokemon Order by ID");
            echo "</tr></thead>Pokemon</tr></thead>";
        }
        printResult($result);
    }

    function handleDisplayTitlesRequest() {
        global $db_conn;
        $result = executePlainSQL("SELECT table_name FROM user_tables"); // print all table names
        printResult($result);
    }

    function handleDisplayItemsRequest() {
        global $db_conn;
        $ID = $_GET['disID'];
        $nickname = $_GET['disNickname'];
        $result = executePlainSQL("SELECT DISTINCT I.* FROM holds H, pokemon_item I WHERE H.iname = I.iname AND H.id = '" . $ID . "' AND H.nickname='" . $nickname . "'");
        printResult($result);
    }

    function handleCountMovesAtLeastRequest() {
        global $db_conn;
        $num = $_GET['disMoveNum'];
        
        
        // executePlainSQL("DROP VIEW Temp");
        executePlainSQL("CREATE VIEW Temp(id, nickname, movecount) as 
                              SELECT id, nickname, COUNT(*) as movecount
                              FROM HasMove
                              GROUP BY id, nickname");
        $result = executePlainSQL("SELECT T.id, T.nickname, T.movecount
                                      FROM Temp T
                                      WHERE movecount >= '" . $num . "'");
        executePlainSQL("DROP VIEW Temp");
        printResult($result);
    }

    function handleDisplayGenRequest() {
        global $db_conn;
        $gen = (int)$_GET['generation'];
        $result = executePlainSQL("SELECT unique id, pname FROM Appear_in_Generation WHERE gname = $gen");
        printResult($result);
    }

    function handleProjectionRequest() {
        global $db_conn;
        $col = $_GET['projection'];
        $result = executePlainSQL("SELECT $col FROM POKEMON GROUP BY $col");
        printResult($result);
    }

    function handleGroupByRequest() {
        global $db_conn;
        $col = $_GET['groupBy'];
        $result = executePlainSQL("SELECT $col, count(*) FROM Pokemon Group By $col");
        printResult($result);
    }

    function handleHavingRequest() {
        global $db_conn;
        $num = $_GET['num'];
        $condition = "count(*) > " . $num;
        $result = executePlainSQL("SELECT rname, count(*) FROM Pokemon Group By RNAME Having $condition");
        printResult($result);
    }

    //desired output: Tianne Ash
    function handleDivRequest() {
        global $db_conn;
        // $result = executePlainSQL("SELECT distinct t.tname FROM Trains t
        //                             WHERE NOT EXISTS 
        //                                     ((SELECT r.rname FROM Region r) MINUS
        //                                     (SELECT distinct p.rname FROM Pokemon p WHERE p.id = t.id AND p.nickname = t.nickname))");
        
        $result = executePlainSQL("SELECT distinct P.nickname, P.pname 
                                    FROM Pokemon P
                                    WHERE NOT EXISTS 
                                            (SELECT distinct I.iname FROM Pokemon_item I WHERE NOT EXISTS 
                                            (SELECT distinct H.iname FROM Holds H WHERE H.iname = I.iname AND P.nickname = H.nickname ))");
        printResult($result);
    }


    // HANDLE ALL POST ROUTES
    // A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
    function handlePOSTRequest() {
        if (connectToDB()) {
            if (array_key_exists('updateQueryRequest', $_POST)) {
                handleUpdateRequest();
            } else if (array_key_exists('insertQueryRequest', $_POST)) {
                handleInsertRequest();
            } else if (array_key_exists('deleteGlRequest', $_POST)) {
                handleDeleteGlRequest();
            }
            disconnectFromDB();
        }
    }

    // HANDLE ALL GET ROUTES
    // A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
    function handleGETRequest() {
        if (connectToDB()) {
            if (array_key_exists('countTuples', $_GET)) {
                handleCountRequest();
            } else if (array_key_exists('displayTitles', $_GET)) {
                handleDisplayTitlesRequest();
            } else if (array_key_exists('displayTuplesRequest', $_GET)) {
                handleDisplayRequest();
            } else if (array_key_exists('displayItemsRequest', $_GET)) {
                handleDisplayItemsRequest();
            } else if (array_key_exists('displayGenRequest', $_GET)) {
                handleDisplayGenRequest();
            } else if (array_key_exists('countMovesAtLeastRequest', $_GET)) {
                handleCountMovesAtLeastRequest();
            } else if (array_key_exists('projectionRequest', $_GET)) {
                handleProjectionRequest();
            } else if (array_key_exists('havingRequest', $_GET)) {
                handleHavingRequest();
            } else if (array_key_exists('groupByRequest', $_GET)) {
                handleGroupByRequest();
            } else if (array_key_exists('divRequest', $_GET)) {
                handleDivRequest();
            }
            disconnectFromDB();
        }
    }

    if (isset($_POST['updateSubmit']) || isset($_POST['insertSubmit']) || isset($_POST['deleteGL'])) {
        handlePOSTRequest();
    } else if (
        isset($_GET['countTupleRequest']) || isset($_GET['displayTitlesRequest']) || isset($_GET['displayItemsRequest'])
        || isset($_GET['displayTuples']) || isset($_GET['generation']) || isset($_GET['projection']) || isset($_GET['having'])
        || isset($_GET['groupBy']) || isset($_GET['countMovesAtLeastRequest']) || isset($_GET['divRequest'])
    ) {
        handleGETRequest();
    }
    ?>

</body>

</html>
