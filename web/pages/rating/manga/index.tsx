"use client" 
import PostsListFilters from 'next' 
import React, { useEffect, useState } from 'react';
import {Title} from "@/model/Title"
import Heading from "@/components/Heading";
import ListItem from "@/components/rating/ListItem";
import RadioGroup from '../optional/aside';
import styleRating from "@/styles/Rating.module.css";

import orderby from "../optional/orderby.json";

export const getServerSideProps = (async (condition: string) => {
    const response = await fetch('http://localhost:4000/api/manga/read');
    const data: Title[] = await response.json();

    if (!data) {
        return {
            notFound: true,
        }
    }
  
    return {
      props: {mangas: data},
    }
}) 

async function getData(filter: string) {
    const resurs = `http://localhost:4000/api/manga/read` + `?order=${filter}`
    const response = await fetch(resurs)
    const data: Title[] = await response.json();

    if (!response.ok) {
      throw new Error('Failed to fetch data')
    }

    return {data}
}

export default function Manga({data: props}:{data:Title[]}) {
    
    const [mangas, setMangas] = useState(props);
    const [triage, setTriage] = useState('rating');
    
    const handlePeriodChange = React.useCallback((val: string) => {
        console.log("handle change")
        setTriage(val);
    }, []);

    useEffect(() => {
        getData(triage).then(x => setMangas(x.data))
    }, [triage]);

    function Aside(): React.ReactElement{
        return (
           <aside className={styleRating.aside}>
                <RadioGroup
                    selected={triage}
                    name="filter"
                    onChange={handlePeriodChange}
                    options={orderby}
                />
            </aside>
        );
    }
    
    return ( 
        <>
        <Heading text='Список манги'
            textP='На данной странице отображена манга, отсортированная по рейтингу'/>

        <div className={styleRating.flex}>
            <div className={styleRating.grid}>
            {mangas?.map((manga: Title) => (
                <ListItem key={manga.id} manga={manga}/> 
            ))}
            </div>
            <Aside/>
        </div>
        </>
    );
}