import * as yup from 'yup';

export const ProjectSchema = yup.object().shape({
  name: yup.string().required('Name is required').defined(),
});
