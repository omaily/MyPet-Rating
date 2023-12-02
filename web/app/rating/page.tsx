import axios from 'axios';
import Link from 'next/link';
import styles from './Rating.module.css';
import ListItem from './manga/page';

type Manga = {
    id: string
    title: string
    title_en: string
    author: string
    rating: number
    start_d: string
    finish_d: string
  };
  
  async function getList(): Promise<Manga[]> {
    const resurs = `http://localhost:4000/manga`
    const response = await axios.get<Manga[]>(
      resurs, 
      { headers: {
        Accept: 'application/json',
      },})
    return response.data;
  }


export default async function Rating() {
// export default async function Rating() {
  const mangas = await getList();
  return(
    <div className={styles.rating }>
      <div className={styles.background}/>
      <div className={styles.content}>
        <h1>Манга</h1>
        <p>На данной странице отображена манга, отсортированная по рейтингу</p>
        <div className={styles.grid}>
          {mangas?.map((manga: Manga) => {
            return <ListItem key={manga.id} manga={manga} />;
          })}
        </div>
      </div>
    </div>
  );
}