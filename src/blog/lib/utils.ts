export const menuItems = [
  { name: "home", href: "/" },
  { name: "about", href: "/about" },
  { name: "posts", href: "/posts/1" },
  { name: "tags", href: "/tags" }
];

export const getImageUrlWithTag = (tag: string) => {
  return `/icons8-${tag}.png`;
}