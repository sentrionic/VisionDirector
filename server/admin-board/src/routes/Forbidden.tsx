import { Flex, Box, Heading, Spacer, Text } from '@chakra-ui/react';

export const Forbidden = (): JSX.Element => {
  return (
    <Flex bg={'gray.50'} minH="100vh" py="12" px={{ base: '4', lg: '8' }}>
      <Box maxW="md" m="auto">
        <Heading textAlign="center" size="xl" fontWeight="extrabold">
          Forbidden
        </Heading>
        <Spacer h="8" />
        <Text>Only the admin is allowed here</Text>
      </Box>
    </Flex>
  );
};
