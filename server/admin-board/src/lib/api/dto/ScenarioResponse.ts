export interface Scenario {
  id: string;
  name: string;
  createdAt: string;
  updatedAt: string;
  url?: string;
  stepCount: number;
  duration: number;
}
