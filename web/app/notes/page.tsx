import axios from 'axios';
import Link from 'next/link';
import styles from './Notes.module.css';

type Manga = {
  id: string
  title: string
  title_en: string
  author: string
  rating: number
  start_d: string
  finish_d: string
};

async function getNotes(): Promise<Manga[]> {
  console.log("getNotes")
  const resurs = `http://localhost:4000/manga`
  const response = await axios.get<Manga[]>(
    resurs, 
    { headers: {
      Accept: 'application/json',
    },})
    // // .then( response => {console.log(response.data)})
    // // .catch( error =>  console.log(error))
    // // .finally( function() {} )  //always executed

  return response.data;
}

function Note({manga}:any) {
  return (
    <Link href={`/notes/${manga.id}`}>
      <div className={styles.note}>
        <h2>{manga.title}</h2>
        <h2>{manga.title_en}</h2>
        <h5>{manga.author}</h5>
        <h5>{manga.start_d}</h5>
        <h5>{manga.finish_d}</h5>
        <p>{manga.rating}</p>
      </div>
    </Link>
  );
}

export default async function NotesPage() {
  const mangas = await getNotes();
  return(
    <div>
      <h1>Notes</h1>
      <div className={styles.grid}>
        {mangas?.map((manga: Manga) => {
          return <Note key={manga.id} manga={manga} />;
        })}
      </div>
    </div>
  );
}

