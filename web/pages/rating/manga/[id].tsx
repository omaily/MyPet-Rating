import type {
    InferGetStaticPropsType,
    GetStaticProps,
    GetStaticPaths,
} from 'next'
import {Title} from "@/model/Title"
import { ParsedUrlQuery } from "querystring";

interface Params extends ParsedUrlQuery {
    slug: string;
}

export const getStaticPaths = (async () => {

    const response = await fetch(`http://localhost:4000/api/manga/read`);
    const data: Title[] = await response.json()
    const paths = data.map(({id}:{id:number}) => ({
        params: {id: id.toString()}
    }));
    
    return {
      paths,
      fallback: true,
    }
}) satisfies GetStaticPaths
   
export const getStaticProps = (async (context) => {
    const {id} = context.params as Params;
    const response = await fetch(`http://localhost:4000/api/manga/read/${id}`);
    const title: Title = await response.json()
    return { props: { title } }
}) satisfies GetStaticProps<{
    title: Title
}>
   
export default function Manga({
    title,
}: InferGetStaticPropsType<typeof getStaticProps>) {
    return  <h1>{title.title}</h1>
}
