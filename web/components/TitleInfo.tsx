import Heading from "./Heading";
import {Title} from "@/model/Title"

const ContactInfo = ({manga}:{manga:Title}) => {
    //const { id, title, rating } = manga || {};
    //const { street, suite, city, zipcode } = title || {};

    //   if (!manga) {
    //     return <Heading text="h3" textP="Empty contact" />
    //   }

  return (
    <>
      <Heading text="Title = " textP={manga.title} />
      <div>
        <strong>Email: </strong>
        {manga.rating}
      </div>
      <div>
        <strong>Address: </strong>
      </div>
    </>
  );
}

export default ContactInfo;