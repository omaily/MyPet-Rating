import PostInfo from "@/components/PostInfo";


export const getStaticPaths = async () => {
    const response = await fetch('https://jsonplaceholder.typicode.com/posts/');
    const data = await response.json();

    const paths = data.map(({id}:{id:number}) => ({
        params: {id: id.toString()}
    }));

    return {
        paths,
        fallback: false,
    }
};

export const getStaticProps = async (context:any) => {
    const {id} = context.params;
    const response = await fetch(`https://jsonplaceholder.typicode.com/posts/${id}`);
    const data = await response.json();

    if (!data) {
        return {
            notFound: true,
        }
    }

    return {
        props: { post: data },
    }
};

const Post = ({ post }:any) => (
    <>
        <h1>{post.title}</h1>
        <p>{post.body}</p>
    </>
    // <PostInfo post={post} />
);

export default Post;