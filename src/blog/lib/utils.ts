export const getImageUrlWithTag = (tag: string) => {
  switch (tag) {
    case 'life':
      return 'https://source.unsplash.com/1600x900/?space';
    case 'food':
      return 'https://source.unsplash.com/1600x900/?planet';
    case 'sports':
      return 'https://source.unsplash.com/1600x900/?galaxy';
    case 'music':
      return 'https://source.unsplash.com/1600x900/?star';
    case 'travel':
      return 'https://source.unsplash.com/1600x900/?moon';
    case 'tech':
      return 'https://source.unsplash.com/1600x900/?earth';
    case 'fashion':
      return 'https://source.unsplash.com/1600x900/?sun';
    default:
      return `/${tag}.svg`
  }
}