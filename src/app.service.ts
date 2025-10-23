import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    const test = process.env['IS_RUNNER'];
    return `Hello World! changed! ㅠㅠㅠ ${test} 젭라 되라 좀`;
  }
}
