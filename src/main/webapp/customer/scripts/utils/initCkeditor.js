
export const initCKEditor = (selector) =>
{
    ClassicEditor
        .create(document.querySelector(selector),
        {
            ckfinder:
            {
                uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
            },
            toolbar:
            {
                items: [
                    'heading', '|',
                    'bold', 'italic', 'link', 'bulletedList', 'numberedList', '|',
                    'outdent', 'indent', '|',
                    'imageUpload', 'blockQuote', 'insertTable', 'mediaEmbed', '|',
                    'undo', 'redo', '|',
                    'fontFamily', 'fontSize', 'fontColor', 'fontBackgroundColor', '|',
                    'alignment', '|',
                    'code', 'codeBlock'
                ]
            },
            language: 'vi',
            image:
            {
                toolbar: [
                    'imageTextAlternative',
                    'imageStyle:full',
                    'imageStyle:side',
                    'linkImage'
                ]
            },
            table:
            {
                contentToolbar: [
                    'tableColumn',
                    'tableRow',
                    'mergeTableCells'
                ]
            }
        })
        .then(editor =>
        {
            window.editor = editor;

            // Tìm form chứa textarea
            const textarea = document.querySelector(selector);
            const form = textarea.closest('form');

            if (form)
            {
                // Lắng nghe sự kiện submit
                form.addEventListener('submit', function(e)
                {
                    // Cập nhật giá trị từ CKEditor vào textarea trước khi submit
                    textarea.value = editor.getData();
                });
            }

            // Hoặc bạn có thể tự động sync mỗi khi có thay đổi
            editor.model.document.on('change:data', () =>
            {
                textarea.value = editor.getData();
            });
        })
        .catch(error =>
        {
            console.error('CKEditor init error:', error);
        });
}