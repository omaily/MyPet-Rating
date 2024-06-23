import Link from "next/link";
import Heading from "@/components/Heading";

export const getStaticProps = async () => {
    const response = await fetch('http://localhost:4000/api/manga/read');
    const data = await response.json();
  
    if (!data) {
      return {
        notFound: true,
      }
    }
  
    return {
      props: {mangas: data},
    }
};
  
const Mangas = ({mangas}:any) => {
    return ( 
        <>
        <Heading text='Manga' textP="
            Ма́нга ж., скл. — японские комиксы, иногда называемые комикку. 
            Манга в форме, в которой она существует в настоящее время, 
            начала развиваться после окончания Второй мировой войны, 
            испытав сильное влияние западных традиций.
        "/>

        <ul>
            {mangas && mangas.map(({id, title}:{id:string, title:string}) => (
            <li key={id}>
                <Link href={`/manga/${id}`}>{title}</Link>
            </li>
            ))}
        </ul>
        </>
    );
}

export default Mangas;