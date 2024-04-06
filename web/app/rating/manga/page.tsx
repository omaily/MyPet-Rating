import Link from 'next/link';
import styles from './Manga.module.css';

export type Manga = {
    id: string
    title: string
    title_en: string
    author: string
    rating: number
    start_d: string
    finish_d: string | null
    img: string
};

export const ListItem = ({manga}: {manga: Manga}): React.ReactElement => {

    return (
            // <article className="flex h-48 items-start dark:bg-slate-800 rounded-xl overflow-hidden">
            <article className={styles.article}>
                {/* <picture className="flex-none h-full w-36 relative "> */}
                <picture className={styles.containerImg}> 
                    <Link href={`/rating/manga/${manga.id}`}>
                    {/* <img className="w-full h-full object-fill bg-center rounded-l-xl" */}
                    <img className={styles.img}
                            src={manga.img}
                            alt="" loading="lazy" />
                    </Link>
                    <div className={styles.overlay}></div>
                </picture>

                {articleName(manga.id, manga.title, manga.title_en, manga.rating)}
                {/* <div className="grow p-2 md:p-4"> */}
                    {/* {headline(manga.id, manga.title, manga.title_en, manga.rating)} */}
                    {/* {additionalParam("Статус:", "издано")} */}
                    {/* {additionalDate("Релиз:", manga.start_d, manga.finish_d)} */}
                    {/* {additionalParam("Автор:", manga.author )} */}
                    {/* {additionalParam("Глав:", "29")} */}
                {/* </div> */}

            </article>
    )
}

const articleName = (id: string, title: string, title_en: string, rating:number): React.ReactElement => (
    <div className={styles.depiction}>
        <div className={styles.title}>
            {title}
        </div>
        <div className={styles.subTitle}>
            {title_en}
        </div>
    </div>
)    

const headline = (id: string, title: string, title_en: string, rating:number): React.ReactElement => (
    <>
        <div className={"flex gap-4"}>
            {/* <h1 className={styles.titleName + " flex-auto text-lg font-semibold"}> */}
            <Link href={`/rating/manga/${id}`} className={styles.titleName}>
                {title}
            </Link>
            {/* </h1> */}
            
            <div className="flex gap-2">
                <dt className=" text-blue-300">
                    <span className="sr-only">Star</span>
                    <svg width="16" height="20" fill="currentColor">
                        <path d="M7.05 3.691c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.372 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.539 1.118l-2.8-2.034a1 1 0 00-1.176 0l-2.8 2.034c-.783.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.363-1.118L.98 9.483c-.784-.57-.381-1.81.587-1.81H5.03a1 1 0 00.95-.69L7.05 3.69z" />
                    </svg>
                </dt>
                <div className="font-semibold text-xl text-blue-100">
                    {rating}
                </div>
            </div>
        </div>
        <div className="mb-2 w-full flex-none text-sm font-medium text-slate-500">
            {title_en}
        </div>
    </>
)


const additionalParam = (param1: string, param2: string): React.ReactElement  => (
    <div className="flex flex-wrap font-medium text-sm">
        <div className="dark:text-slate-500 pr-1">
            {param1}
        </div>
        <div className="text-blue-300 ">
            {param2}
        </div>
    </div>
)


const additionalDate = (attribute: string, startDate: string , endDate: string | null): React.ReactElement  => {

    function convertParseDate(x: string| null): string {
        const parsedDate = new Date(x!);
        if (x == null) {
            return "нет"
        }
        if (isNaN(parsedDate.getDate())) {
            return x;
        }
        // return parsedDate.toLocaleDateString("ru-RU");
        return parsedDate.getFullYear().toString();
    }
    
    let releaseDate: string = "c " + convertParseDate(startDate)
    releaseDate += endDate !== null ? " по " + convertParseDate(endDate): ''
    
    return (
        <div className="flex flex-wrap font-medium ">
            <div className="dark:text-slate-500 pr-1">
                {attribute}
            </div>
            <div className="text-blue-300 truncate ">
                {releaseDate}
            </div>
        </div>
    )
}

export default ListItem;