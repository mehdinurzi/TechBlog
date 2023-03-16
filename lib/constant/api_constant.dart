class ApiUrlConstant{


static const baseUrl="https://techblog.sasansafari.com/Techblog/api/";
static const hostDlUrl="https://techblog.sasansafari.com";
static const getHomeItems="${baseUrl}home/?command=index";
static const getPodcastListItems="${baseUrl}podcast/get.php?command=new&user_id=1";
static const getArticleListItems="${baseUrl}article/get.php?command=new&user_id=1";
static const postRegister="${baseUrl}register/action.php";
static const getPublishedByMe="${baseUrl}article/get.php?command=published_by_me&user_id=";
static const articlepost="${baseUrl}article/post.php";


}
class ApiArticleKeyConstant{
  static const title="title";
  static const content="content";
  static const catId="cat_id";
  static const tagList="tag_list";
  static const userId="user_id";
  static const image="image";
  static const command="command";
}