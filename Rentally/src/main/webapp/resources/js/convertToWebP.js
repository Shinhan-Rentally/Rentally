async function convertToWebP(file) {
    return new Promise((resolve) => {
        const reader = new FileReader();
        reader.onload = function (event) {
            const img = new Image();
            img.onload = function () {
                const canvas = document.createElement("canvas");
                canvas.width = img.width;
                canvas.height = img.height;
                const ctx = canvas.getContext("2d");
                ctx.drawImage(img, 0, 0);
                canvas.toBlob(
                    (blob) => {
                        const webpFile = new File(
                            [blob],
                            file.name.replace(/\.[^/.]+$/, ".webp"),
                            { type: "image/webp" }
                        );
                        resolve(webpFile);
                    },
                    "image/webp"
                );
            };
            img.src = event.target.result;
        };
        reader.readAsDataURL(file);
    });
}
