<?php echo $header; ?>

<div class="edit_site_page">

    <div class='page_help_block'><?php echo $page_help_link; ?></div>

    <h1><?php echo $lang_heading; ?></h1>

    <hr>

    <?php if ($success) { ?>
        <div class="success"><?php echo $success; ?></div>
    <?php } ?>

    <?php if ($info) { ?>
        <div class="info"><?php echo $info; ?></div>
    <?php } ?>

    <?php if ($error) { ?>
        <div class="error"><?php echo $error; ?></div>
    <?php } ?>

    <?php if ($warning) { ?>
        <div class="warning"><?php echo $warning; ?></div>
    <?php } ?>

    <div class="description"><?php echo $lang_description; ?></div>

    <form action="index.php?route=edit/site&amp;id=<?php echo $id; ?>" class="controls" method="post">
        <div class="fieldset">
            <label><?php echo $lang_entry_name; ?></label>
            <input type="text" required name="name" class="large" value="<?php echo $name; ?>" maxlength="250">
            <a class="hint" onmouseover="showhint('<?php echo $lang_hint_name; ?>', this, event, '')">[?]</a>
            <?php if ($error_name) { ?>
                <span class="error"><?php echo $error_name; ?></span>
            <?php } ?>
        </div>

        <div class="fieldset">
            <label><?php echo $lang_entry_domain; ?></label>
            <input type="text" required name="domain" class="large" value="<?php echo $domain; ?>" maxlength="250">
            <a class="hint" onmouseover="showhint('<?php echo $lang_hint_domain; ?>', this, event, '')">[?]</a>
            <?php if ($error_domain) { ?>
                <span class="error"><?php echo $error_domain; ?></span>
            <?php } ?>
        </div>

        <div class="fieldset">
            <label><?php echo $lang_entry_url; ?></label>
            <input type="text" required name="url" class="large" value="<?php echo $url; ?>" maxlength="250">
            <a class="hint" onmouseover="showhint('<?php echo $lang_hint_url; ?>', this, event, '')">[?]</a>
            <?php if ($error_url) { ?>
                <span class="error"><?php echo $error_url; ?></span>
            <?php } ?>
        </div>

        <div class="fieldset">
            <label><?php echo $lang_entry_iframe; ?></label>
            <input type="checkbox" name="iframe_enabled" value="1" <?php if ($iframe_enabled) { echo 'checked'; } ?>>
            <a class="hint" onmouseover="showhint('<?php echo $lang_hint_iframe; ?>', this, event, '')">[?]</a>
        </div>

        <div class="fieldset">
            <label><?php echo $lang_entry_new_pages; ?></label>
            <input type="checkbox" name="new_pages" value="1" <?php if ($new_pages) { echo 'checked'; } ?>>
            <a class="hint" onmouseover="showhint('<?php echo $lang_hint_new_pages; ?>', this, event, '')">[?]</a>
        </div>

        <div class="fieldset">
            <label><?php echo $lang_entry_from_name; ?></label>
            <input type="text" name="from_name" class="large" value="<?php echo $from_name; ?>" maxlength="250">
            <a class="hint" onmouseover="showhint('<?php echo $lang_hint_from_name; ?>', this, event, '')">[?]</a>
            <?php if ($error_from_name) { ?>
                <span class="error"><?php echo $error_from_name; ?></span>
            <?php } ?>
        </div>

        <div class="fieldset">
            <label><?php echo $lang_entry_from_email; ?></label>
            <input type="text" name="from_email" class="large" value="<?php echo $from_email; ?>" maxlength="250">
            <a class="hint" onmouseover="showhint('<?php echo $lang_hint_from_email; ?>', this, event, '')">[?]</a>
            <?php if ($error_from_email) { ?>
                <span class="error"><?php echo $error_from_email; ?></span>
            <?php } ?>
        </div>

        <div class="fieldset">
            <label><?php echo $lang_entry_reply_email; ?></label>
            <input type="text" name="reply_email" class="large" value="<?php echo $reply_email; ?>" maxlength="250">
            <a class="hint" onmouseover="showhint('<?php echo $lang_hint_reply_email; ?>', this, event, '')">[?]</a>
            <?php if ($error_reply_email) { ?>
                <span class="error"><?php echo $error_reply_email; ?></span>
            <?php } ?>
        </div>

        <div class="fieldset">
            <label><?php echo $lang_entry_date; ?></label>
            <div><?php echo $date_added; ?></div>
        </div>

        <input type="hidden" name="csrf_key" value="<?php echo $csrf_key; ?>">

        <div class="buttons">
            <input type="submit" class="button" value="<?php echo $lang_button_update; ?>" title="<?php echo $lang_button_update; ?>">

            <input type="button" class="button" name="delete" data-id="<?php echo $id; ?>" value="<?php echo $lang_button_delete; ?>" title="<?php echo $lang_button_delete; ?>">
        </div>

        <div class="links"><a href="<?php echo $link_back; ?>"><?php echo $lang_link_back; ?></a></div>
    </form>

    <div id="delete_dialog" title="<?php echo $lang_dialog_delete_title; ?>" style="display:none">
        <span class="ui-icon ui-icon-alert"></span> <?php echo $lang_dialog_delete_content; ?>
    </div>

    <style>
    .ui-dialog .ui-icon-alert {
        margin-bottom: 10px;
    }
    </style>

    <script>
    // <![CDATA[
    $(document).ready(function() {
        $('input[name="delete"]').click(function(e) {
            e.preventDefault();

            var id = $(this).data('id');

            $('#delete_dialog').dialog({
                modal: true,
                height: 'auto',
                width: 'auto',
                resizable: false,
                draggable: false,
                center: true,
                buttons: {
                    '<?php echo $lang_dialog_yes; ?>': function() {
                        $('form').attr('action', 'index.php?route=manage/sites');

                        var input = $('<input>').attr('type', 'hidden').attr('name', 'single_delete').val(id);

                        $('form').append($(input));

                        $('form').submit();

                        $(this).dialog('close');
                    },
                    '<?php echo $lang_dialog_no; ?>': function() {
                        $(this).dialog('close');
                    }
                }
            });

            $('#delete_dialog').dialog('open');
        });
    });
    // ]]>
    </script>

</div>

<?php echo $footer; ?>