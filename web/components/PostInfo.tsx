import Heading from "@/components/Heading";

const PostInfo = ({post}:any) => {
  const { title, body } = post || {};

  if (!post) {
    return <Heading text="h3" textP="Empty post" />
  }

  return (
    <>
      <Heading text="h3" textP={title} />
      <p>{body}</p>
    </>
  );
}

export default PostInfo;