import Link from "next/link";
import Heading from "../../components/Heading";

export const getStaticProps = async () => {
  const response = await fetch('https://jsonplaceholder.typicode.com/posts');
  const data = await response.json();

  if (!data) {
    return {
      notFound: true,
    }
  }

  return {
    props: { posts: data },
  }
};

const Posts = ({posts}: any) => { 
  return (
    <>
      <Heading 
            text='Posts' 
            textP="Полезно знать : Маршрутизатор приложений имеет приоритет над Маршрутизатором страниц. 
            Маршруты между каталогами не должны разрешаться по одному и тому же URL-пути 
            и приведут к ошибке во время сборки, чтобы предотвратить конфликт."/>
      <ul>
        {posts && posts.map(({ id, title }:{id:string, title:string}) => (
          <li key={id}>
            <Link href={`/posts/${id}`}>{title}</Link>
          </li>
        ))}
      </ul>
    </>
  );
};

export default Posts;