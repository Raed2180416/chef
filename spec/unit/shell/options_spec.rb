#
# Copyright:: Copyright (c) 2009-2026 Progress Software Corporation and/or its subsidiaries or affiliates. All Rights Reserved.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "spec_helper"

describe Shell::Options do
  describe ".print_help" do
    let(:options) { instance_double(Shell::Options, opt_parser: "usage", parse_options: nil) }

    before do
      allow(described_class).to receive(:new).and_return(options)
      allow(described_class).to receive(:footer).and_return("")
      allow(Chef::Licensing).to receive(:licensing_help).and_return("")
    end

    it "exits with a zero status so requesting help is not reported as a failure" do
      expect { described_class.print_help }.to raise_error(SystemExit) do |error|
        expect(error.status).to eq(0)
      end
    end
  end
end
