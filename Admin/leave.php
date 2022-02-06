<?php
include('top.inc.php');
if (isset($_GET['type']) && $_GET['type'] == 'delete' && isset($_GET['id'])) {
    $id = mysqli_real_escape_string($con, $_GET['id']);
    mysqli_query($con, "delete from leave_applied where LID = '$id'");
    header('location:leave.php');
    die();
}

if (isset($_GET['type']) && $_GET['type'] == 'update' && isset($_GET['id'])) {
    $id = mysqli_real_escape_string($con, $_GET['id']);
    $status = mysqli_real_escape_string($con, $_GET['status']);
    if ($status == '2') {
        mysqli_query($con, "update leave_applied set Leave_status = '2' where LID ='" . $id . "'");
    } else  if ($status == '3') {
        mysqli_query($con, "update leave_applied set Leave_status = '3' where LID ='" . $id . "'");
    }
    header('location:leave.php');
    die();
}

if ($_SESSION['ROLE'] != 'Admin' && $_SESSION['ROLE'] != 'admin') {
    $res = mysqli_query($con, "select * from leave_applied where FID ='" . $_SESSION['USER_ID'] . "'");
} else {
    $res = mysqli_query($con, "select * from leave_applied");
}

?>
<div class="content pb-0">
    <div class="orders">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="box-title" style="font-size:25px;">List of leave applied</h4>
                    </div>
                    <div class="card-body--">
                        <div class="table-stats order-table ov-h">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Leave ID</th>
                                        <th>Fculty ID</th>
                                        <th>Faculty name</th>
                                        <th>Type of leave</th>
                                        <th>Leave from</th>
                                        <th>Leave to</th>
                                        <th>Faculty adjusted</th>
                                        <th>Leave description</th>
                                        <th>Leave status</th>
                                        <?php if ($_SESSION['ROLE'] == 'Admin' || $_SESSION['ROLE'] == 'admin') { ?><th></th> <?php } ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    while ($row = mysqli_fetch_assoc($res)) { ?>
                                        <tr>
                                            <td><?php echo $row['LID'] ?></td>
                                            <td><?php echo $row['FID'] ?></td>
                                            <td><?php #echo $row['FName'] 
                                                ?></td>
                                            <td><?php echo $row['Leave_type'] ?></td>
                                            <td><?php echo $row['Leave_from'] ?></td>
                                            <td><?php echo $row['Leave_to'] ?></td>
                                            <td><?php print_r($row['FAdjusted']) ?></td>
                                            <td><?php echo $row['Leave_desc'] ?></td>
                                            <td>
                                                <?php
                                                if ($_SESSION['ROLE'] != 'Admin' && $_SESSION['ROLE'] != 'admin') {
                                                    if ($row['Leave_status'] == '1')
                                                        echo "Applied";
                                                    if ($row['Leave_status'] == '2')
                                                        echo "Approved";
                                                    if ($row['Leave_status'] == '3')
                                                        echo "Rejected";
                                                } else {
                                                    if ($row['Leave_status'] == '1')
                                                        echo "Applied";
                                                    if ($row['Leave_status'] == '2')
                                                        echo "Approved";
                                                    if ($row['Leave_status'] == '3')
                                                        echo "Rejected";
                                                ?><br>
                                                    <select name="uls" onchange="update_status('<?php echo $row['LID'] ?>', this.options[this.selectedIndex].value)">
                                                        <option value="1">Update status</option>
                                                        <option value="2">Approve</a></option>
                                                        <option value="3">Reject</option>
                                                    </select>
                                                <?php
                                                }
                                                ?>
                                            </td>
                                            <?php
                                            if ($_SESSION['ROLE'] == 'Admin' || $_SESSION['ROLE'] == 'admin') { ?>
                                                <td>
                                                    <a href="leave.php?id=<?php echo $row['LID'] ?>&type=delete" style="margin-left:20px;">DELETE</a>
                                                </td>
                                            <?php
                                            }
                                            ?>
                                        </tr>
                                    <?php
                                        $i++;
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function update_status(lid, value) {
        window.location.href = "http://localhost/lms/Admin/leave.php?id=" + lid + "&type=update&status=" + value;
    }
</script>
<?php
include('footer.inc.php')
?>