// app/javascript/components/photo_preview.js
const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  // if (input.files && input.files[0]) {

  //   const reader = new FileReader();
  //   const photo = document.getElementById('photo-preview')

  //   reader.onload = (event) => {
  //     photo.src = event.target.result;
  //   }
  //   reader.readAsDataURL(input.files[0])
  //   document.getElementById('photo-preview').classList.remove('hidden');
  // }


  const photo = document.getElementById('photo-preview')
  photo.src = URL.createObjectURL(input.files[0])
}

export { previewImageOnFileSelect };
