// ブログのタイトル
export const blogTitle = "noobegin";

// メニューの項目
export const menuItems = [
  { name: "home", href: "/" },
  { name: "about", href: "/about" },
  { name: "posts", href: "/posts/1" },
  { name: "tags", href: "/tags" }
];

// フッターのメニューの項目
export const footerMenuItems = [
  { name: "about", href: "/about" },
  { name: "terms", href: "/terms" },
  { name: "privacy", href: "/privacy" },
  // { name: "contact", href: "/contact" }
];

// 1ページあたりの記事数
export const postsPerPage = 6;

export const author = {
  icon: "/author.jpg",
  name: "ささきよ",
  place: "広島市",
  occupation: "インフラエンジニア",
  hobbies: ["プログラミング", "読書", "音楽"],
  description: "色々やってきて、なんだかんだでITの世界の末席に加わってます。",

  socailLinks: [
    { name: "github", url: "https://github.com/sskyh0208" },
    { name: "x", url: "https://x.com/sskyh0208" },
  ],
};

export const histories = [
  {
    start: "2023.06",
    end: "",
    description: "いろんなシステムのAWSインフラを構築してます。"
  },
  {
    start: "2021.10",
    end: "2023.02",
    description: "自動発注システムを開発してました。"
  },
  {
    start: "2019.09",
    end: "2021.09",
    description: "インシデント管理システムの開発をしてました。"
  },
  {
    start: "2018.01",
    end: "2019.02",
    description: "物流の営業マンしてました。"
  },
  {
    start: "2017.04",
    end: "2017.06",
    description: "繁殖牝馬のお世話をしてました。"
  },
  {
    start: "2013.04",
    end: "2017.03",
    description: "モールス信号のための暗号文を作成してました。"
  },
  {
    start: "",
    end: "2013.03",
    description: "DJしたり音楽作ったりしてました。"
  },
]