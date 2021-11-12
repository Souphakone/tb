<?php
ob_start();
/*todo add variables*/
?>
<section class="row">
    <table class="table">
        <thead>
            <tr>
                <td>
                    Nom
                </td>
                <td>
                    status
                </td>
                <td>
                    rôle
                </td>
            </tr>
        </thead>
        <tbody>

            <tr>
                <td>
                    <?= $_SESSION["member"]->name ?>
                </td>
                <td>
                    <?  ?>
                </td>
                <td>
                    <? ?>
                </td>
            </tr>
        </tbody>

    </table>
</section>


<?php
$content = ob_get_clean();
require_once 'view/layout.php'; ?>