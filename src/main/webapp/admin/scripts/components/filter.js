document.addEventListener('DOMContentLoaded', function () {

    function setupFilterToggle(buttonId, frameId) {
        const filterBtn = document.getElementById(buttonId);
        const filterFrame = document.getElementById(frameId);

        if (filterBtn && filterFrame) {
            filterBtn.addEventListener('click', function (event) {
                document.querySelectorAll('.filter__frame').forEach(frame => {
                    if (frame.id !== frameId) {
                        frame.classList.add('hidden');
                    }
                });

                filterFrame.classList.toggle('hidden');
                event.stopPropagation();
            });

            filterFrame.addEventListener('click', function (event) {
                event.stopPropagation();
            });

            document.addEventListener('click', function () {
                if (!filterFrame.classList.contains('hidden')) {
                    filterFrame.classList.add('hidden');
                }
            });
        }
    }

    setupFilterToggle('product__filter__btn', 'product__filter__frame');

    setupFilterToggle('order__filter__btn', 'order__filter__frame');

    setupFilterToggle('email__filter__btn', 'email__filter__frame');

    setupFilterToggle('blog__filter__btn', 'blog__filter__frame');



    document.querySelectorAll('.apply__button, .clear__button').forEach(btn => {
        btn.addEventListener('click', function () {
            this.closest('.filter__frame').classList.add('hidden');
        });
    });
});