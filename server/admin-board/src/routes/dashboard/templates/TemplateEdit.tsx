import {
  Box,
  Button,
  Divider,
  Flex,
  Heading,
  IconButton,
  Modal,
  ModalBody,
  ModalCloseButton,
  ModalContent,
  ModalFooter,
  ModalHeader,
  ModalOverlay,
  Spacer,
  Table,
  Tbody,
  Td,
  Tfoot,
  Th,
  Thead,
  Tr,
  useDisclosure,
  useToast,
  VStack,
  Text,
} from "@chakra-ui/react";
import { Form, Formik } from "formik";
import {
  AiOutlineEdit,
  AiOutlineFileAdd,
  AiOutlinePlusSquare,
} from "react-icons/ai";
import { useParams } from "react-router-dom";
import { InputField } from "../../../components/common/InputField";
import { editTemplate, getTemplates } from "../../../lib/api/axios";
import {
  TemplateSchema,
  TemplateStepSchema,
} from "../../../lib/validation/template.schema";
import { v4 } from "uuid";
import { DragDropContext, Droppable, Draggable } from "react-beautiful-dnd";
import { TemplateStep } from "../../../lib/api/dto/TemplateResponse";
import { useRef, useState } from "react";
import { useQuery } from "@tanstack/react-query";

export const TemplateEdit = (): JSX.Element => {
  const { templateId } = useParams();
  const { isOpen, onOpen, onClose } = useDisclosure();
  const {
    isOpen: isEditOpen,
    onOpen: onEditOpen,
    onClose: onEditClose,
  } = useDisclosure();
  const toast = useToast();
  const inputFile: any = useRef(null);
  const [current, setCurrent] = useState("");

  const key = "tKey";

  const { data } = useQuery([key], async () => {
    const response = await getTemplates();
    return response.data;
  });

  const reorder = (
    list: TemplateStep[],
    startIndex: number,
    endIndex: number
  ) => {
    const result = Array.from(list);
    const [removed] = result.splice(startIndex, 1);
    result.splice(endIndex, 0, removed);

    return result;
  };

  if (!data) return <Box />;

  const template = data.find((e) => e.id === templateId);

  if (!template) return <Box />;

  // Caution: Nested mess.
  return (
    <>
      <Flex align="center" justify="center" minH="100vh" bg="#f7fafc">
        <Box textAlign="center">
          <Heading mb="4">Edit Template</Heading>
          <Box
            w="5xl"
            textAlign="center"
            bg="white"
            boxShadow="base"
            borderRadius="lg"
            p="6"
          >
            <Heading size="md" mb="4">
              Required
            </Heading>
            <Formik
              validationSchema={TemplateSchema}
              initialValues={{
                name: template.name,
                description: template.description,
                steps: template.steps,
              }}
              onSubmit={async (values) => {
                try {
                  const formData = new FormData();
                  formData.append("name", values.name);
                  formData.append("description", values.description);

                  for (let i = 0; i < values.steps.length; i++) {
                    const step = values.steps[i];
                    formData.append(`steps[${i}].id`, step.id);
                    formData.append(`steps[${i}].name`, step.name);
                    formData.append(
                      `steps[${i}].duration`,
                      step.duration.toString()
                    );
                    formData.append(
                      `steps[${i}].position`,
                      step.position.toString()
                    );
                    if (step.media) {
                      formData.append(`steps[${i}].media`, step.media);
                    }
                  }

                  await editTemplate(template.id, formData);
                  toast({
                    title: "Template Updated.",
                    status: "success",
                    duration: 5000,
                    isClosable: true,
                  });
                } catch (err) {}
              }}
            >
              {({ isSubmitting, values: formValues, setFieldValue }) => (
                <Form>
                  <VStack spacing="20px">
                    <InputField label="Name" name="name" />
                    <InputField
                      label="Description"
                      name="description"
                      textarea={true}
                    />
                    <Divider />

                    <Flex align={"center"}>
                      <Heading size="md">Steps</Heading>
                      <Spacer w={"5"} />
                      <>
                        <IconButton
                          icon={<AiOutlinePlusSquare />}
                          aria-label="Add Step"
                          onClick={onOpen}
                        />
                        <Modal isOpen={isOpen} onClose={onClose}>
                          <ModalOverlay />
                          <Formik
                            validationSchema={TemplateStepSchema}
                            initialValues={{
                              name: "",
                              duration: 15,
                              media: null,
                            }}
                            onSubmit={async (values) => {
                              try {
                                setFieldValue("steps", [
                                  ...formValues.steps,
                                  {
                                    ...values,
                                    id: v4(),
                                    position: formValues.steps.length,
                                  },
                                ]);
                                onClose();
                              } catch (err: any) {}
                            }}
                          >
                            {({
                              isSubmitting,
                              setFieldValue: setStepFieldValue,
                              values: stepValues,
                            }) => (
                              <Form>
                                <ModalContent>
                                  <ModalHeader>Add Step</ModalHeader>
                                  <ModalCloseButton />

                                  <ModalBody pb={6}>
                                    <InputField label="Name" name="name" />
                                    <InputField
                                      label="Duration in s"
                                      name="duration"
                                      type={"number"}
                                    />
                                    <Flex
                                      align={"center"}
                                      justify="space-between"
                                      mt={6}
                                    >
                                      <Button
                                        variant="outline"
                                        colorScheme={"blue"}
                                        leftIcon={<AiOutlineFileAdd />}
                                        onClick={() =>
                                          inputFile.current.click()
                                        }
                                        w="full"
                                      >
                                        Select Media
                                      </Button>
                                      {stepValues.media && (
                                        <Text ml="4">
                                          Please set the duration to the videos
                                          duration. Ignore if file is an image.
                                        </Text>
                                      )}
                                    </Flex>
                                    <input
                                      type="file"
                                      name="media"
                                      accept="image/*,video/*"
                                      ref={inputFile}
                                      hidden
                                      onChange={async (e) => {
                                        if (!e.currentTarget.files) return;
                                        setStepFieldValue(
                                          "media",
                                          e.currentTarget.files[0]
                                        );
                                      }}
                                    />
                                  </ModalBody>

                                  <ModalFooter>
                                    <Button
                                      colorScheme="blue"
                                      mr={3}
                                      type="submit"
                                      isLoading={isSubmitting}
                                    >
                                      Add
                                    </Button>
                                    <Button onClick={onClose}>Cancel</Button>
                                  </ModalFooter>
                                </ModalContent>
                              </Form>
                            )}
                          </Formik>
                        </Modal>
                      </>
                    </Flex>

                    <Table variant="simple">
                      <Thead>
                        <StepTableInfo />
                      </Thead>
                      <DragDropContext
                        onDragEnd={(result) => {
                          if (!result.destination) {
                            return;
                          }

                          const items = reorder(
                            formValues.steps,
                            result.source.index,
                            result.destination.index
                          );

                          const newValues = items.map((e, i) => {
                            const ts: TemplateStep = { ...e, position: i };
                            return ts;
                          });

                          setFieldValue("steps", newValues);
                        }}
                      >
                        <Droppable droppableId="droppable">
                          {(provided) => (
                            <Tbody
                              {...provided.droppableProps}
                              ref={provided.innerRef}
                            >
                              {formValues.steps.map((s, i) => (
                                <Draggable
                                  key={s.id}
                                  draggableId={s.id}
                                  index={i}
                                >
                                  {(provided) => (
                                    <Tr
                                      _hover={{ bg: "borderGray" }}
                                      key={s.id}
                                      ref={provided.innerRef}
                                      {...provided.draggableProps}
                                      {...provided.dragHandleProps}
                                    >
                                      <Td>#{s.position + 1}</Td>
                                      <Td>{s.name}</Td>
                                      <Td>{s.duration}</Td>
                                      <Td>
                                        {!!s.media
                                          ? s.media.fileUrl ?? "Selected"
                                          : null}
                                      </Td>
                                      <Td>
                                        <>
                                          <IconButton
                                            aria-label="Edit"
                                            icon={<AiOutlineEdit />}
                                            onClick={() => {
                                              setCurrent(s.id);
                                              onEditOpen();
                                            }}
                                          />
                                          <>
                                            <Modal
                                              isOpen={
                                                isEditOpen && current === s.id
                                              }
                                              onClose={onEditClose}
                                            >
                                              <ModalOverlay />
                                              <Formik
                                                validationSchema={
                                                  TemplateStepSchema
                                                }
                                                initialValues={{
                                                  id: s.id,
                                                  name: s.name,
                                                  duration: s.duration,
                                                  position: s.position,
                                                  media: s.media,
                                                }}
                                                onSubmit={async (values) => {
                                                  try {
                                                    const index =
                                                      formValues.steps.findIndex(
                                                        (e) => e.id === s.id
                                                      );
                                                    const newValues = [
                                                      ...formValues.steps,
                                                    ];
                                                    if (index !== -1) {
                                                      newValues[index] = {
                                                        ...values,
                                                      };
                                                    }
                                                    setFieldValue("steps", [
                                                      ...newValues,
                                                    ]);
                                                    onEditClose();
                                                  } catch (err: any) {}
                                                }}
                                              >
                                                {({
                                                  isSubmitting,
                                                  values: editValues,
                                                  setFieldValue:
                                                    setEditFieldValue,
                                                }) => (
                                                  <Form>
                                                    <ModalContent>
                                                      <ModalHeader>
                                                        Edit Step
                                                      </ModalHeader>
                                                      <ModalCloseButton />

                                                      <ModalBody pb={6}>
                                                        <InputField
                                                          label="Name"
                                                          name="name"
                                                        />
                                                        <InputField
                                                          label="Duration in s"
                                                          name="duration"
                                                          type={"number"}
                                                        />
                                                        <Flex
                                                          align={"center"}
                                                          justify="space-between"
                                                          mt={6}
                                                        >
                                                          <Button
                                                            variant="outline"
                                                            colorScheme={"blue"}
                                                            leftIcon={
                                                              <AiOutlineFileAdd />
                                                            }
                                                            onClick={() =>
                                                              inputFile.current.click()
                                                            }
                                                            w="full"
                                                          >
                                                            Select Media
                                                          </Button>
                                                          {editValues.media && (
                                                            <Text ml="4">
                                                              Please set the
                                                              duration to the
                                                              videos duration.
                                                              Ignore if file is
                                                              an image.
                                                            </Text>
                                                          )}
                                                        </Flex>
                                                        <input
                                                          type="file"
                                                          name="media"
                                                          accept="image/*,video/*"
                                                          ref={inputFile}
                                                          hidden
                                                          onChange={async (
                                                            e
                                                          ) => {
                                                            if (
                                                              !e.currentTarget
                                                                .files
                                                            )
                                                              return;
                                                            setEditFieldValue(
                                                              "media",
                                                              e.currentTarget
                                                                .files[0]
                                                            );
                                                          }}
                                                        />
                                                      </ModalBody>

                                                      <ModalFooter>
                                                        <Button
                                                          colorScheme="blue"
                                                          mr={3}
                                                          type="submit"
                                                          isLoading={
                                                            isSubmitting
                                                          }
                                                        >
                                                          Edit
                                                        </Button>
                                                        <Button
                                                          onClick={onEditClose}
                                                        >
                                                          Cancel
                                                        </Button>
                                                      </ModalFooter>
                                                    </ModalContent>
                                                  </Form>
                                                )}
                                              </Formik>
                                            </Modal>
                                          </>
                                        </>
                                      </Td>
                                    </Tr>
                                  )}
                                </Draggable>
                              ))}
                            </Tbody>
                          )}
                        </Droppable>
                      </DragDropContext>
                      <Tfoot>
                        <StepTableInfo />
                      </Tfoot>
                    </Table>

                    <Divider />
                    <Button
                      type="submit"
                      disabled={isSubmitting}
                      colorScheme="blue"
                    >
                      Submit
                    </Button>
                  </VStack>
                </Form>
              )}
            </Formik>
          </Box>
        </Box>
      </Flex>
    </>
  );
};

const StepTableInfo: React.FC = () => {
  return (
    <Tr>
      <Th>Position</Th>
      <Th>Name</Th>
      <Th>Duration (s)</Th>
      <Th>Media</Th>
      <Th>Action</Th>
    </Tr>
  );
};
