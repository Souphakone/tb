<?php
ob_start();
var_dump($Teams);
?>

<section class="row">
    <table class="table">
        <thead>
            <tr>
                <td>
                    My teams
                </td>
                <td>
                    Numbers
                </td>
                <td>
                    Captain
                </td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($Teams as $team) : ?>
                <tr>
                    <td>
                        <?= $team['name'] ?>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>

            <?php endforeach; ?>
        </tbody>

    </table>
</section>


<?php
$content = ob_get_clean();
require_once 'view/layout.php'; ?>