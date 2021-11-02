<?php
ob_start();
?>

<section class="row">
    <table class="table">
        <thead>
            <tr>
                <td>
                    Member
                </td>
                <td>
                    Teams
                </td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($members as $member) : ?>
                <tr>
                    <td>
                        <?= $member->name ?>
                    </td>
                    <td>
                        <?php foreach ($member->teams() as $key => $team) : ?>
                            <?= $team->name ?>
                            <?= ($key !== array_key_last($member->teams()) ? ", " : "")  ?>
                        <?php endforeach; ?>
                    </td>
                </tr>

            <?php endforeach; ?>
        </tbody>

    </table>
</section>


<?php
$content = ob_get_clean();
require_once 'view/layout.php'; ?>