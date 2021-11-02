<?php
ob_start();
var_dump($Roles);
?>

<section class="row">
    <table class="table">
        <thead>
            <tr>
                <td>
                    Role
                </td>
                <td>
                    Teams
                </td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($Roles as $Role) : ?>
                <tr>
                    <td>
                        <?= $Role->name ?>
                    </td>
                </tr>

            <?php endforeach; ?>
        </tbody>

    </table>
</section>


<?php
$content = ob_get_clean();
require_once 'view/layout.php'; ?>