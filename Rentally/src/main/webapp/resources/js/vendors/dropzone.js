Dropzone.autoDiscover = false;

function initializeDropzone(selector, path) {
    const dropzone = new Dropzone(selector, {
        url: `${path}/admin/product/add`,
        maxFilesize: 5,
        acceptedFiles: "image/*",
        addRemoveLinks: true,
        autoProcessQueue: false,
        dictDefaultMessage: "파일을 드래그하거나 클릭하여 선택하세요.",
        maxFiles: 1,
        dictMaxFilesExceeded: "하나의 파일만 업로드할 수 있습니다."
    });

    // Add common event listeners
    dropzone.on("addedfile", function (file) {
        console.log(`File added: ${file.name}`);
    });

    dropzone.on("removedfile", function (file) {
        console.log(`File removed: ${file.name}`);
    });

    dropzone.on("success", function (file, response) {
        console.log(`File uploaded successfully:`, response);
    });

    return dropzone;
}

const imgDropzone = initializeDropzone("#img-dropzone", "<%= path %>");
const detailDropzone = initializeDropzone("#detail-dropzone", "<%= path %>");
